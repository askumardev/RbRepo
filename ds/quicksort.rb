# frozen_string_literal: true

# def quick_sort(list)
#   return [] if list.empty?
#   groups = list.group_by { |n| n <=> list.first }
#   less_than    = groups[-1] || []
#   first        = groups[0]  || []
#   greater_than = groups[1]  || []
#   quick_sort(less_than) + first + quick_sort(greater_than)
# end
# p quick_sort [3, 7, 2, 1, 8, 12]

class Array
  def quicksort
    return [] if empty?

    pivot = delete_at(rand(size))
    puts pivot
    left, right = partition(&pivot.method(:>))
    [*left.quicksort, pivot, *right.quicksort]
  end
end
arr = [3, 7, 2, 1, 8, 12]
p arr.quicksort
