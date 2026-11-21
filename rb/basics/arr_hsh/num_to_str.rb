# ruby arr_hsh/num_to_str.rb

class IndianNumberToWords
  ONES = %w[
    zero one two three four five six seven eight nine
    ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen
  ].freeze

  TENS = %w[
    zero ten twenty thirty forty fifty sixty seventy eighty ninety
  ].freeze

  SCALES = {
    10_000_000 => "crore",
    100_000    => "lakh",
    1_000      => "thousand",
    100        => "hundred"
  }.freeze

  def self.convert(number)
    return "zero" if number == 0
    raise ArgumentError, "Only positive integers are supported" if number < 0

words = []

    SCALES.each do |value, name|
      if number >= value
        count = number / value
        words << convert(count)
        words << name
        number %= value
      end
    end

    if number >= 20
      words << TENS[number / 10]
      words << ONES[number % 10] if number % 10 != 0
    elsif number > 0
      words << ONES[number]
    end

    words.join(" ")
    puts words
    puts("<============>")
  end

end

IndianNumberToWords.convert(1)
# => "one"

IndianNumberToWords.convert(105)
# => "one hundred five"

# IndianNumberToWords.convert(1_250)
# # => "one thousand two hundred fifty"

# IndianNumberToWords.convert(1_00_000)
# # => "one lakh"

# IndianNumberToWords.convert(12_34_567)
# # => "twelve lakh thirty four thousand five hundred sixty seven"

# IndianNumberToWords.convert(5_67_89_012)
# => "five crore sixty seven lakh eighty nine thousand twelve"
