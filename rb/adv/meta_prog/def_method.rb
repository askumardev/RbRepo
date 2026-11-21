# ruby adv/def_method.rb

class Doctor
  %w[rhinoplasty checkup interpretive_dance].each do |action|
    define_method("perform_#{action}") do |argument|
      "performing #{action.gsub('_', ' ')} on #{argument}"
    end
  end
end

doctor = Doctor.new
puts doctor.perform_rhinoplasty('nose')
puts doctor.perform_checkup('throat')
# puts doctor.perform_interpretive_dance("in da club")


# class Person
#   ATTRIBUTES = [:name, :age, :location]

#   ATTRIBUTES.each do |attr|
#     define_method(attr) do
#       instance_variable_get("@#{attr}")
#     end

#     define_method("#{attr}=") do |value|
#       instance_variable_set("@#{attr}", value)
#     end
#   end
# end

# person = Person.new
# person.name = "John Doe"
# person.age = 30
# person.location = "New York"

# puts person.name      # Output: "John Doe"
# puts person.age       # Output: 30
# puts person.location
