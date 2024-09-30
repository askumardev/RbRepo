def mask_characters(string, mask_char = '*', visible_count = 4)
  masked_length = [0, string.length - visible_count].max
  mask = mask_char * masked_length
  p mask
  visible_part = string[-visible_count..-1]
  p visible_part
  mask + visible_part
end

# Example usage
masked_string = mask_characters("1234567890")
puts masked_string  # Output: ******7890


# ruby misc/mask_chars.rb
