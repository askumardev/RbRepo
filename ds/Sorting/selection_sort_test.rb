# ruby ds/Sorting/selection_sort_test.rb

require 'minitest/autorun'
require_relative './sort_tests'
require_relative './selection_sort'

class TestSelectionSort < Minitest::Test
  include SortTests

  def sort(input)
    selection_sort(input)
  end
end
