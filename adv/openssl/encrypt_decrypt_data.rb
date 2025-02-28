# ruby adv/openssl/encrypt_decrypt_data.rb

require 'openssl'
require 'base64'
require 'json'

# Sample JSON payload
data = {
  name: "Satish Kumar",
  email: "abc123@example.com",
  phone: "123456789"
}.to_json

# AES Encryption method
def encrypt_json(json_data, key, iv)
  cipher = OpenSSL::Cipher.new('aes-256-cbc')
  cipher.encrypt
  cipher.key = key
  cipher.iv = iv

  encrypted = cipher.update(json_data) + cipher.final
  Base64.strict_encode64(encrypted) # Encode in Base64 for safe storage/transmission
end

# AES Decryption method
def decrypt_json(encrypted_data, key, iv)
  decipher = OpenSSL::Cipher.new('aes-256-cbc')
  decipher.decrypt
  decipher.key = key
  decipher.iv = iv

  decrypted = decipher.update(Base64.decode64(encrypted_data)) + decipher.final
  JSON.parse(decrypted) # Convert back to JSON
end

# Generate a random 256-bit key and 128-bit IV
key = OpenSSL::Random.random_bytes(32) # 32 bytes for AES-256
iv = OpenSSL::Random.random_bytes(16)  # 16 bytes IV for AES

# Encrypt JSON
encrypted_data = encrypt_json(data, key, iv)
puts "Encrypted JSON: #{encrypted_data}"

# Decrypt JSON
decrypted_data = decrypt_json(encrypted_data, key, iv)
puts "Decrypted JSON: #{decrypted_data}"
