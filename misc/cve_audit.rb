require 'bundler/audit/scanner'
require 'yaml'
require 'json'
require 'time'
require 'date'

IGNORE_FILE = '.cve_ignore.yml'
LOG_FILE = 'cve_audit_log.json'
WARNING_DAYS = 7

# Load ignored CVEs with expiry
def ignored_cves
  return [] unless File.exist?(IGNORE_FILE)

  data = YAML.load_file(IGNORE_FILE)
  (data['ignore'] || []).map do |entry|
    {
      cve: entry['cve'],
      expires_on: Date.parse(entry['expires_on'].to_s),
      reason: entry['reason'],
      owner: entry['owner']
    }
  end
end

# Severity classification
def severity_level(cvss_score)
  case cvss_score.to_f
  when 9.0..10.0 then 'CRITICAL'
  when 7.0...9.0 then 'HIGH'
  when 4.0...7.0 then 'MEDIUM'
  else 'LOW'
  end
end

# Log results for RCA tracking
def log_vulnerability(vuln, status, metadata = {})
  log_data = File.exist?(LOG_FILE) ? JSON.parse(File.read(LOG_FILE)) : []

  log_data << {
    gem: vuln.gem.name,
    version: vuln.gem.version.to_s,
    cve: vuln.advisory.cve,
    title: vuln.advisory.title,
    severity: severity_level(vuln.advisory.cvss_v3),
    status: status,
    reason: metadata[:reason],
    owner: metadata[:owner],
    expires_on: metadata[:expires_on],
    detected_at: Time.now.iso8601
  }

  File.write(LOG_FILE, JSON.pretty_generate(log_data))
end

# Find ignore entry
def find_ignore_entry(cve, ignored_list)
  ignored_list.find { |entry| entry[:cve] == cve }
end

# Main execution
scanner = Bundler::Audit::Scanner.new
ignored_list = ignored_cves
today = Date.today

expired_found = false
critical_found = false

puts "🔍 Running CVE scan with expiry validation...\n\n"

scanner.scan do |vuln|
  cve = vuln.advisory.cve
  severity = severity_level(vuln.advisory.cvss_v3)
  ignore_entry = find_ignore_entry(cve, ignored_list)

  if ignore_entry
    expiry_date = ignore_entry[:expires_on]
    days_left = (expiry_date - today).to_i

    if expiry_date >= today
      puts "⚠️  IGNORED (VALID): #{cve} (#{severity})"
      puts "     Owner: #{ignore_entry[:owner]}"
      puts "     Expires On: #{expiry_date} (#{days_left} days left)"
      puts "     Reason: #{ignore_entry[:reason]}"

      # Warning if nearing expiry
      if days_left <= WARNING_DAYS
        puts "     ⚠️  WARNING: Ignore expiring soon!"
      end

      log_vulnerability(vuln, 'IGNORED_VALID', ignore_entry)
    else
      puts "⏰ EXPIRED IGNORE: #{cve} (#{severity})"
      puts "     Owner: #{ignore_entry[:owner]}"
      puts "     Expired On: #{expiry_date}"
      puts "     Reason: #{ignore_entry[:reason]}"

      expired_found = true
      log_vulnerability(vuln, 'EXPIRED_IGNORE', ignore_entry)
    end

  else
    puts "❌ VULNERABLE: #{cve} (#{severity})"
    puts "     Title: #{vuln.advisory.title}"

    critical_found = true if severity == 'CRITICAL'
    log_vulnerability(vuln, 'OPEN')
  end

  puts "-" * 60
end

puts "\n📊 Scan completed. Logs stored in #{LOG_FILE}"

# CI/CD Exit Strategy
if expired_found
  puts "\n🚨 Build FAILED: Expired CVE ignores found!"
  exit(1)
elsif critical_found
  puts "\n🚨 Build FAILED: Critical vulnerabilities detected!"
  exit(1)
else
  puts "\n✅ Build PASSED: No blocking vulnerabilities."
  exit(0)
end


# bundle audit update
# ruby misc/cve_audit.rb
