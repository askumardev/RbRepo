# require 'benchmark'

# s = "one thing, two things, three things, four things"
# result = ""

# Benchmark.bmbm do |b|
#   b.report("strip/split: ") { 1_000_000.times {result = s.split(",").map(&:strip)} }
#   b.report("regex: ") { 1_000_000.times {result = s.split(/\s*,\s*/)} }
# end
#strip removes the white spaces before
str = "    hello   samp   "
p str.strip

str2 = "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
p str2.split #returns arry ["Lorem", "Ipsum",...]
p str2.split(//) #["L", "o", "r", "e", "m", " ",...]
p str2.chars

# ruby basics/String/split_strip.rb