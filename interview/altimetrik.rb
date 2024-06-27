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
