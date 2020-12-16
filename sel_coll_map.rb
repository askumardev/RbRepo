# frozen_string_literal: true

list = (1..10).to_a

p list
p list.collect { |i| i >= 3 && i <= 7 }
p list.map { |i| i >= 3 && i <= 7 }
p list.select { |i| i >= 3 && i <= 7 }
