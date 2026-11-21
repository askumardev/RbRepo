# require 'humanize'

# number = 1234
# str = number.humanize
# p str

ONES = %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
TENS = %w(zero ten twenty thirty forty fifty sixty seventy eighty ninety)
HUNDRED = "hundred"
THOUSAND = "thousand"

def number_to_words(num)
  return ONES[num] if num < 20

  if num < 100
    tens = TENS[num / 10]
    ones = num % 10 == 0 ? "" : ONES[num % 10]
    return "#{tens} #{ones}".strip
  end

  if num < 1000
    hundreds = ONES[num / 100] + " #{HUNDRED}"
    remainder = num % 100
    return remainder == 0 ? hundreds : "#{hundreds} #{number_to_words(remainder)}"
  end

  if num < 10000
    thousands = ONES[num / 1000] + " #{THOUSAND}"
    remainder = num % 1000
    return remainder == 0 ? thousands : "#{thousands} #{number_to_words(remainder)}"
  end
end

number = 1234
puts number_to_words(number)  # Output: "one thousand two hundred thirty-four"


# ruby adv/humanize_demo.rb