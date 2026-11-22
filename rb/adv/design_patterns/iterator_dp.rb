# Iterator:
# Traverses a collection without exposing its internal representation.
# Ruby blocks and Enumerable provide native iterator support.

class NumberRange
  include Enumerable

  def initialize(start_value, finish_value)
    @start_value = start_value
    @finish_value = finish_value
  end

  def each
    return enum_for(:each) unless block_given?

    (@start_value..@finish_value).each { |number| yield number }
  end
end

range = NumberRange.new(2, 5)
puts range.map { |number| number * number }.join(", ")
puts range.select(&:even?).join(", ")
