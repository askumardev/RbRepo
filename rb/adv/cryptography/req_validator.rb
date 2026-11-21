require 'openssl'
require 'base64'   # ✅ REQUIRED
require 'uri'
require_relative 'mac_generator'
class RequestValidator
  ALLOWED_TIME_DRIFT = 300

  def initialize(secret)
    @secret = secret
    @mac_generator = MacGenerator.new(secret)
  end

  def validate(headers, body, method, uri)
    return [false, "Invalid timestamp"] unless valid_timestamp?(headers[:ts])
    return [false, "Body hash mismatch"] unless valid_bodyhash?(headers[:bodyhash], body)
    return [false, "MAC mismatch"] unless valid_mac?(headers, method, uri)

    [true, "VALID"]
  end

  private

  def valid_timestamp?(ts)
    request_time = Time.at(ts.to_i)
    (Time.now - request_time).abs <= ALLOWED_TIME_DRIFT
  end

  def valid_bodyhash?(received_hash, body)
    computed = Base64.strict_encode64(
      OpenSSL::Digest::SHA256.digest(body)
    )
    computed == received_hash
  end

  def valid_mac?(headers, method, uri)
    begin
      # 🔹 Try decoding
      decoded_mac = Base64.strict_decode64(headers[:mac])
    rescue ArgumentError
      # ❌ Invalid Base64
      return false
    end

    computed_mac = @mac_generator.generate_binary(
      ts: headers[:ts],
      nonce: headers[:nonce],
      method: method,
      uri: uri,
      bodyhash: headers[:bodyhash]
    )

    secure_compare(decoded_mac, computed_mac)
  end

  def secure_compare(a, b)
    return false unless a && b && a.bytesize == b.bytesize
    result = 0
    a.bytes.zip(b.bytes) { |x, y| result |= x ^ y }
    result == 0
  end
end

# ---------------- TEST DATA ----------------

secret = "my_secret_key"
body   = '{"amount":100}'
method = "POST"
uri    = "http://example.com/api/v1/payments"

ts    = Time.now.to_i.to_s
nonce = "abc123xyz"

# Generate bodyhash
bodyhash = Base64.strict_encode64(
  OpenSSL::Digest::SHA256.digest(body)
)

# Generate valid MAC
mac_generator = MacGenerator.new(secret)
valid_mac = mac_generator.generate(
  ts: ts,
  nonce: nonce,
  method: method,
  uri: uri,
  bodyhash: bodyhash
)

# ---------------- VALID SCENARIO ----------------
puts "\n--- VALID SCENARIO ---"

valid_headers = {
  ts: ts,
  nonce: nonce,
  bodyhash: bodyhash,
  mac: valid_mac
}

validator = RequestValidator.new(secret)
valid, message = validator.validate(valid_headers, body, method, uri)

puts "#{message} #{valid ? '✅' : '❌'}"

# ---------------- INVALID SCENARIOS ----------------

# ❌ 1. Body tampered
puts "\n--- INVALID: BODY TAMPERED ---"

invalid_body = '{"amount":999}'

valid, message = validator.validate(valid_headers, invalid_body, method, uri)
puts "#{message} ❌"

# ❌ 2. MAC tampered
puts "\n--- INVALID: MAC TAMPERED ---"

invalid_headers_mac = valid_headers.merge(mac: "fake_mac")

valid, message = validator.validate(invalid_headers_mac, body, method, uri)
puts "#{message} ❌"

# ❌ 3. Timestamp expired
puts "\n--- INVALID: TIMESTAMP EXPIRED ---"

old_ts_headers = valid_headers.merge(ts: (Time.now.to_i - 1000).to_s)

valid, message = validator.validate(old_ts_headers, body, method, uri)
puts "#{message} ❌"

# ruby adv/cryptography/req_validator.rb
