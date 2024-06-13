class HelloWorld
  def say_hello 
    "Hello World!"
  end   
end

describe 'HelloWorld' do      
  it "should say 'Hello World' when we call the say_hello method" do 
    hw = HelloWorld.new 
    message = hw.say_hello 
    expect(message).to eq "Hello World!"
  end

  it "should say 'Hello World' when we call the say_hello method" do 
    hw = HelloWorld.new 
    message = hw.say_hello 
    #expect(message).to eq "Hello World...!"
    expect(message).to eq "Hello World!"
  end
end

context 'hello world', focus:true do
  it 'should run hello world with focus' do
    expect(1).to be(1)
  end
end

fcontext 'hello world' do
  it 'should run hello world with fcontext' do
    expect(1).to be(1)
  end
end