# ruby interview/altimetrik.rb

def is_palin(x)
  rev = 0
  num = x
  return false if num < 0
  while num != 0
    ex = num % 10 # Extract the last digit
    # p ex
    rev = rev * 10 + ex # Append the digit to rev
    # p rev
    num = num / 10 # Remove the last digit from num
    # p num
  end
  if rev != x
    false
  else
    true
  end
end

p is_palin(-11) # should return false
p is_palin(1234) # should return false
p is_palin(1221) # should return true
#---------------------
class MyController < ApplicationController
  def options
    options = {}
    available_option_keys = [:first_option, :second_option, :third_option]
    all_keys = params.keys.map(&:to_sym) #[:first,:second]
    set_option_keys = all_keys & available_option_keys #[:first,:second, :first_option, :second_option, :third_option]
    set_option_keys.each do |key|
        options[key] = params[key]
    end
    #options = set_option_keys.map{|x| options[x] = params[x]}
    puts options
  end
end
#======================================
class MyController < ApplicationController
  def update_options
    available_option_keys = [:first_option, :second_option, :third_option]
    options_to_update = params.permit(available_option_keys)

    options_to_update.each do |key, value|
      options[key.to_sym] = value
    end
  end
#============or===============================
  def update_options
    available_option_keys = [:first_option, :second_option, :third_option]
    
    params.slice(*available_option_keys).each do |key, value|
      options[key.to_sym] = value
    end
  end
end


#====================================
def magic(x, y)
  if ( x.even? && y.odd?)
     return true
  elsif x % 2 == 1 && y % 2 == 0
     return true
  elsif x == 0 && y == 0
     return false
  elsif (x-y) + (y-x) == 0
     magic(0,0)
  end
end

def magic(x, y)
  return true if (x.even? && y.odd?) || (x.odd? && y.even?)
  return false if x == 0 && y == 0
  magic(0,0) if x == y
  # The last condition always returns true since (x-y) + (y-x) is always 0
  # This part is redundant and can be removed
end

p magic(2,3)
p magic(0,0)
p magic(4,4)

Employee.order(salary: :desc).limit(2).last
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

users_with_same_email = User.where(email: user.email)
users_with_same_email.offset(1).destroy_all


RSpec.define coontroller do
 describe "GET options" do
    before do
      options ={}
      available_option_keys = [:first_option, :second_option, :third_option]
    end
    let(:all_keys) = params.keys.map(&:to_sym) #[:first,:second]

    it "should fetch set all options" do
     set_option_keys = all_keys & available_option_keys

     expect(options).should_not be empty
    end
  end
end


require 'json'
hsh = {"a" => 1, "b" => 2}
puts hsh.to_json
p "------------"
json = {"name" => "ashish", "address" => {"city" => "Chennei", "zip" => "434343"}}
puts json.dig("address", "zip")
