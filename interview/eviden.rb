module A
   def say
     puts "this is module A"
   end
end
 
class B
   include A
   
    def say
        puts "This is Class B Say"
    end
end



class C < B
   extend A
end
 
B.new.say
C.say


resources :posts do
  member do
    get 'comments'
  end
  collection do
    post 'bulk_upload'
  end
end

posts/:id/comments

posts/bulk_upload