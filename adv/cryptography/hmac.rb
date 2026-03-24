require 'openssl'
require 'base64'
require 'time'

class RequestValidator
  ALLOWED_TIME_DRIFT = 300 # 5 minutes

  def initialize(secret)
    @secret = secret
  end

  def valid?(headers, body)
    validate_timestamp(headers[:ts]) &&
    validate_bodyhash(headers[:bodyhash], body) &&
    validate_mac(headers)
  end

  private

  # 🔹 1. Timestamp Validation
  def validate_timestamp(ts)
    request_time = Time.at(ts.to_i)
    current_time = Time.now

    if (current_time - request_time).abs > ALLOWED_TIME_DRIFT
      puts "Invalid timestamp ❌"
      return false
    end

    true
  end

  # 🔹 2. Body Hash Validation
  def validate_bodyhash(received_hash, body)
    computed_hash = Base64.strict_encode64(
      OpenSSL::Digest::SHA256.digest(body)
    )

    if computed_hash != received_hash
      puts "Body hash mismatch ❌"
      return false
    end

    true
  end

  # 🔹 3. MAC Validation (as per your requirement)
  def validate_mac(headers)
    sender_mac = headers[:mac]
    ts         = headers[:ts]
    nonce      = headers[:nonce]
    bodyhash   = headers[:bodyhash]

    # ✅ Step 1: Decode sender MAC (Base64 → binary)
    decoded_mac = Base64.strict_decode64(sender_mac)

    # ✅ Step 2: Build data string
    data = [ts, nonce, bodyhash].join("\n")

    # ✅ Step 3: Compute MAC (binary)
    computed_mac = OpenSSL::HMAC.digest("SHA256", @secret, data)

    # ✅ Step 4: Secure compare
    unless secure_compare(decoded_mac, computed_mac)
      puts "MAC mismatch ❌"
      return false
    end

    true
  end

  # 🔐 Secure comparison (prevents timing attacks)
  def secure_compare(a, b)
    return false unless a && b && a.bytesize == b.bytesize

    result = 0
    a.bytes.zip(b.bytes) { |x, y| result |= x ^ y }
    result == 0
  end
end

# ---------------- RUN ----------------
secret = "my_secret_key"

body = '{"amount":100,"currency":"INR"}'

ts = Time.now.to_i.to_s
nonce = "abc123xyz"

bodyhash = Base64.strict_encode64(
  OpenSSL::Digest::SHA256.digest(body)
)

data = [ts, nonce, bodyhash].join("\n")

mac = Base64.strict_encode64(
  OpenSSL::HMAC.digest("SHA256", secret, data)
)

headers = {
  id: "client_1",
  ts: ts,
  nonce: nonce,
  bodyhash: bodyhash,
  mac: mac
}

validator = RequestValidator.new(secret)

puts validator.valid?(headers, body) ? "VALID ✅" : "INVALID ❌"
