require 'openssl'
require 'base64'
require 'uri'

class MacGenerator
  def initialize(secret)
    @secret = secret
  end

  def generate(ts:, nonce:, method:, uri:, bodyhash:)
    method = method.to_s.upcase
    uri    = URI.parse(uri)

    mac_input = [
      ts,
      nonce,
      method,
      uri.path,
      uri.host,
      uri.port,
      bodyhash
    ].join("\n")

    digest = OpenSSL::HMAC.digest("SHA256", @secret, mac_input)

    Base64.strict_encode64(digest)
  end

  # 🔹 Binary version (for secure compare)
  def generate_binary(ts:, nonce:, method:, uri:, bodyhash:)
    method = method.to_s.upcase
    uri    = URI.parse(uri)

    mac_input = [
      ts,
      nonce,
      method,
      uri.path,
      uri.host,
      uri.port,
      bodyhash
    ].join("\n")

    OpenSSL::HMAC.digest("SHA256", @secret, mac_input)
  end
end
