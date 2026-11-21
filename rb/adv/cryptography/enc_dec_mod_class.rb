# ruby adv/cryptography/enc_dec_mod_class.rb

require 'openssl'
require 'base64'
require 'json'

# AES Encryption Module
module AESCrypto
  AES_ALGORITHM = 'aes-256-cbc'.freeze

  def generate_key
    OpenSSL::Random.random_bytes(32) # 256-bit key
  end

  def generate_iv
    OpenSSL::Random.random_bytes(16) # 128-bit IV
  end

  def encrypt(json_data, key, iv)
    cipher = OpenSSL::Cipher.new(AES_ALGORITHM)
    cipher.encrypt
    cipher.key = key
    cipher.iv = iv

    encrypted = cipher.update(json_data.to_json) + cipher.final
    Base64.strict_encode64(encrypted) # Return Base64 encoded string
  end

  def decrypt(encrypted_data, key, iv)
    decipher = OpenSSL::Cipher.new(AES_ALGORITHM)
    decipher.decrypt
    decipher.key = key
    decipher.iv = iv

    decrypted = decipher.update(Base64.decode64(encrypted_data)) + decipher.final
    JSON.parse(decrypted) # Convert back to JSON
  end
end

# AES Encryption Class
class AESService
  include AESCrypto

  attr_reader :key, :iv

  def initialize
    @key = generate_key
    @iv = generate_iv
  end

  def encrypt_json(json_data)
    encrypt(json_data, @key, @iv)
  end

  def decrypt_json(encrypted_data)
    decrypt(encrypted_data, @key, @iv)
  end
end

aes_service = AESService.new

# Sample JSON payload
json_payload = {
  name: "Satish Kumar",
  email: "abc123@example.com",
  phone: "123456789"
}

# Encrypt JSON
encrypted_data = aes_service.encrypt_json(json_payload)
puts "Encrypted Data: #{encrypted_data}"

# Decrypt JSON
decrypted_data = aes_service.decrypt_json(encrypted_data)
puts "Decrypted Data: #{decrypted_data}"
