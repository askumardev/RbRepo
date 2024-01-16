# ruby ds/Sorting/bubble_sort.rb

def bubble_sort(array)
  n = array.length
  loop do
    swapped = false

    (n - 1).times do |i|
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        swapped = true
      end
    end

    break unless swapped
  end

  array
end

a = [9, 1, 5, 3, 7, 2, 8, 6, 4]
b = [9, 1, 8, 2, 7, 3, 6, 4, 5]
p bubble_sort(a)
p bubble_sort(b)