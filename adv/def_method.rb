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
