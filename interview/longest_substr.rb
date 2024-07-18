# ruby interview/longest_substr.rb

def substr(a)
  return '' unless a.length.positive?

  result = 0
  (0...a.first.length).each do |k|
    all_matched = true
    character = a.first[k]
    a.each { |str| all_matched &= (character == str[k]) }
    break unless all_matched

    result += 1
  end
  a.first.slice(0, result)
end

# input = ["Extra tv in bedroom",
#  "Extra tv in living room",
#  "Extra tv outside the shop"]
input = %w[helloworld hellokitty hell hello hellojin]

puts substr(input)
def substr(a)
  return '' unless a.length.positive?

  result = 0
  (0...a.first.length).each do |k|
    all_matched = true
    character = a.first[k]
    a.each { |str| all_matched &= (character == str[k]) }
    break unless all_matched

    result += 1
  end
  a.first.slice(0, result)
end

# input = ["Extra tv in bedroom",
#  "Extra tv in living room",
#  "Extra tv outside the shop"]
input = %w[helloworld hellokitty hell hello hellojin]

puts substr(input)

string = "abcaaadefdgdhijkl"
puts substr(string)
