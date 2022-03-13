# Given an array A of strings made only from lowercase letters, return a list of all characters that show up in all strings within the list (including duplicates).  For example, if a character occurs 3 times in all strings but not 4 times, you need to include that character three times in the final answer.

# You may return the answer in any order.

# Example 1:

# Input: ["bella","label","roller"]
# Output: ["e","l","l"]
# Example 2:

# Input: ["cool","lock","cook"]
# Output: ["c","o"]
 
# Note:

# 1 <= A.length <= 100
# 1 <= A[i].length <= 100
# A[i][j] is a lowercase letter

def common_chars(a)
  a.each_with_index do |word, index|
    a[index] = word.split('')
  end
    
  key_hash = create_hash_of_common_characters(a)
       
  key_hash.reject! { |k, v| v == 0 }.to_a
    
  results = []
    
  key_hash.each do |array|
    array[1].times do
      results << array[0]
    end
  end
    
  results 
end

def create_hash_of_common_characters(a)
  key_hash = Hash.new(0)
    
  a.each_with_index do |chars_array, index|
    if index == 0          
      chars_array.each do |char|
        key_hash[char] += 1
      end
    else
      chars_hash = Hash.new(0)
      
      chars_array.each do |char|
        chars_hash[char] += 1
      end
      
      key_hash.keys.each do |char|
        key_hash[char] = 0 if chars_hash[char] == 0
        
        key_hash[char] = [
          chars_hash[char], 
          key_hash[char]
        ].min
      end
    end
  end
    
  key_hash
end
