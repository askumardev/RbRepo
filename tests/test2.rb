result = []

begin
  result << "try"
rescue TypeError
  result << "except"
else
  result << "else"
ensure
  result << "finally"
end

puts result.inspect
