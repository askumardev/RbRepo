lower = "abcdefghijklmnopqrstuvwxyz"
upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
numbers = '1234567890'
symbols = "~!@#$%^&*()_=+-/[\|;:'][{,./<>?}"
password = lower + upper + numbers + symbols
p password
password = password.chars.sample(8).join
puts password

# ruby basics/String/pwd_generator.rb