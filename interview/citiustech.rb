class Documet < ApplicationRecord
  belongs_to :documentable, polymorphic: true
 end

 class RegistrationDocument < ApplicationRecord
  has_many :documents, as : documentable
 end

Class LoginDocuments
end

p "---------------------------------"
class Human
  def talk
      puts "I’m talking"
  end
   private
   def whisper
        puts "I’m whispering"
   end
end
 
Human.new.talk puts "I’m talking"
Human.new.whisper error
Human.new.send(:talk) "I’m talking"
Human.new.send(:whisper) "I’m whispering"
p "--------------------------------------------"


arr = [1,1,1,1,2,2,2,3,3,4] #---> find highest frequent number
frequency_hash = arr.map { |x| [x, arr.count(x)] }.to_h

# Find the key-value pair with the maximum count
max_pair = frequency_hash.max_by { |_, count| count }

# Extract the character and its count
max_char = max_pair[0]
max_count = max_pair[1]

puts "Character with maximum frequency: #{max_char}"
puts "Maximum frequency count: #{max_count}"
&
[1,[2,3,4,5]]--->single dim array without flatten method


p "----------------------------------------------------"
User
Post

@user  = User.joins(:posts)
@user.post.title