def remove_duplicates(input_str)
  char_array = input_str.chars
  result_array = []

  char_array.each do |char|
    result_array << char unless result_array.include?(char)
  end

  return result_array.join('')
end

# Example usage:
original_str = "hello world"
result_str = remove_duplicates(original_str)

puts result_str

# ruby interview/mkvision.rb