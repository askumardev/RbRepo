class User
  def name
    "Alice"
  end

  def greet
    "Hello, #{name}"
  end
end

RSpec.describe User do
  it 'greets the user with their name' do
    user = User.new
    
    # Stub the name method
    allow(user).to receive(:name).and_return("Bob")
    
    # Expect the name method to be called
    expect(user).to receive(:name)
    
    expect(user.greet).to eq("Hello, Bob")
  end
end
