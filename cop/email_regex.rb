# ruby cop/email_regex.rb

def valid_email?(email)
  !!(email =~ /\A[\w\.-]+@[\w\.-]+\.\w+\z/)
end


# Example usage
puts valid_email?("test@example.com")         # true
puts valid_email?("invalid-email")            # false
