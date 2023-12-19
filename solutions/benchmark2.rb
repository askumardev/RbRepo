# frozen_string_literal: true
require 'benchmark'

def perform_with_frozen_string_literal
  result = ""
  100000.times do |i|
    result += "Number #{i}, "
  end
  result
end

time_with_frozen = Benchmark.realtime do
  perform_with_frozen_string_literal
end

puts "Time with frozen_string_literal: #{time_with_frozen} seconds"