# ruby adv/cryptography/fjrc4.rb

class FJRC4
  def initialize(key)
    @s = (0..255).to_a
    @key = key.bytes.cycle.take(256)
    key_scheduling_algorithm
  end

  def key_scheduling_algorithm
    j = 0
    256.times do |i|
      j = (j + @s[i] + @key[i]) % 256
      @s[i], @s[j] = @s[j], @s[i] # Swap
    end
  end

  def pseudo_random_generation_algorithm(text)
    i = j = 0
    text.bytes.map do |byte|
      i = (i + 1) % 256
      j = (j + @s[i]) % 256
      @s[i], @s[j] = @s[j], @s[i] # Swap
      k = @s[(@s[i] + @s[j]) % 256]
      (byte ^ k).chr
    end.join
  end

  def encrypt(plaintext)
    pseudo_random_generation_algorithm(plaintext)
  end

  def decrypt(ciphertext)
    pseudo_random_generation_algorithm(ciphertext) # RC4 decryption is symmetric
  end
end

# Example usage
key = "SecretKey"
plaintext = "Hello, FJ-RC4!"

cipher = FJRC4.new(key)
ciphertext = cipher.encrypt(plaintext)
puts "Ciphertext: #{ciphertext.inspect}"

decrypted_text = FJRC4.new(key).decrypt(ciphertext)
puts "Decrypted: #{decrypted_text}"
