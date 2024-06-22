require 'bouncer'
describe 'Bouncer' do
  it "rejects xx from entering the venue" do
    b = Bouncer.new
    bounced = b.bounce('xx')
    expect(bounced).to be_truthy
  end

  it 'checking for pending spec'

  xit 'naming a spec as pending' do
    pending("yet to code") do
      expect(1).to be(1)
      raise "this is the failure"
    end
    # 
  end

  it "checks something" do
    expect(3+4).to be(7)
    #expect(3+4).to be(47)
  end
end

#rspec .\spec\bounce_spec.rb