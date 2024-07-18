require 'addition'

describe Addition do
  context "With blank input" do
    it "should return 0 when a string is blank" do
       a = Addition.new
       test_string = ''
       expect(a.add(test_string)).to eq(0)
    end
  end

  context "With 1 as input" do
    it "should return 1 when a string is 1" do
       a = Addition.new
       test_string = '1'
       expect(a.add(test_string)).to eq(1)
    end
  end

  context "With negative value as input" do
    it "should return message when a string has negative value" do
       a = Addition.new
       test_string = '1,-1,5'
       expect(a.add(test_string)).to eq("negative numbers not allowed")
    end
  end

  context "With positive values as input" do
    it "should return sum" do
       a = Addition.new
       test_string = '1,1,5'
       expect(a.add(test_string)).to eq(7)
    end
  end

  context "With multiple positive values as input" do
    it "should return sum" do
       a = Addition.new
       test_string = '1,1,5,3'
       expect(a.add(test_string)).to eq(10)
    end
  end

  context "With multiple positive values and delimiter in the beginning as input" do
    it "should return sum" do
       a = Addition.new
       test_string = '1,1,\n5,3'
       expect(a.add(test_string)).to eq(10)
    end
  end
  context "With multiple positive values and delimiter in the end as input" do
    it "should return sum" do
       a = Addition.new
       test_string = '1,1,5\n,3'
       expect(a.add(test_string)).to eq(10)
    end
  end
end
