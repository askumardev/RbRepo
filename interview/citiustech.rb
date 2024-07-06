class Documet < ApplicationRecord
  belongs_to :documaentable, polymorphic: true
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


[1,1,1,1,2,2,2,3,3,4]---> find highest frequbt number
&
[1,[2,3,4,5]]--->single dim array without flatten method
p "----------------------------------------------------"
User
Post

@user  = User.joins(:posts)
@user.post.title