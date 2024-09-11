class StrGenerator
  def random_str
    "A" * rand(1..10)
  end
end

RSpec.describe "Random" do
  it "generates random string" do
    str = StrGenerator.new
    allow(str).to receive(:rand).and_return(5)
    #expect(str.random_str).to eq("AAA")

    result = str.random_str
    #p result
    # Verify that the length of the result is 5
    expect(result.length).to eq(5)
    # Verify that the result is a string of "A"s
    expect(result).to eq('A' * 5)
  end
end
