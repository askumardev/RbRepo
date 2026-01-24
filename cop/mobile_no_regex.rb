# ruby cop/mobile_no_regex.rb

def valid_indian_mobile?(number)
  !!(number =~ /\A[6-9]\d{9}\z/)
end


puts valid_indian_mobile?("9876543210")       # true
puts valid_indian_mobile?("1234567890")
