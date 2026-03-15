class StrGenerator
  def random_str
    "A" * rand(1..10)
  end
end

RSpec.describe "StrGenerator" do
  let(:generator) { StrGenerator.new }

  # Example 1
  it "uses a stub" do
    allow(generator).to receive(:rand).and_return(5)
    expect(generator.random_str).to eq("AAAAA")
  end # <-- Close 1

  # Example 2
  it "uses a mock" do
    expect(generator).to receive(:rand).and_return(3)
    generator.random_str
  end # <-- Close 2

  # Example 3 (The one that was likely missing)
  it "uses a double with allow" do
    fake = double("Fake")
    allow(fake).to receive(:random_str).and_return("AAA")
    expect(fake.random_str).to eq("AAA")
  end # <-- Close 3
end
