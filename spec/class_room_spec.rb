# rspec spec/class_room_spec.rb

# RSpec Doubles, also known as RSpec Mocks. A Double is an object which can “stand in” for
# another object. You’re probably wondering what that means exactly and why you’d need one.

require 'class_room'
describe ClassRoom do
  it 'the list_student_names method should work correctly' do
    student1 = double('student')
    student2 = double('student')

    allow(student1).to receive(:name) { 'John Smith'}
    allow(student2).to receive(:name) { 'Jill Smith'}

    cr = ClassRoom.new [student1,student2]
    expect(cr.list_student_names).to eq('John Smith,Jill Smith')
  end
end
