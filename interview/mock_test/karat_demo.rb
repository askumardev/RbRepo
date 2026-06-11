# O(n*m) — single pass, most general
def find_rectangle(image)
  top, left, bottom, right = nil, nil, nil, nil

  image.each_with_index do |row, r|
    row.each_with_index do |pixel, c|
      next unless pixel == 0

      top    = top    ? [top, r].min    : r
      bottom = bottom ? [bottom, r].max : r
      left   = left   ? [left, c].min   : c
      right  = right  ? [right, c].max  : c
    end
  end

  {
    row:    top,
    column: left,
    width:  right - left + 1,
    height: bottom - top + 1
  }
end

# O(n+m) — leverages the solid-rectangle guarantee
# Scan rows independently to find vertical bounds,
# scan columns independently to find horizontal bounds.
def find_rectangle_fast(image)
  top    = image.index        { |row| row.include?(0) }
  bottom = image.rindex       { |row| row.include?(0) }

  cols   = image.transpose
  left   = cols.index         { |col| col.include?(0) }
  right  = cols.rindex        { |col| col.include?(0) }

  {
    row:    top,
    column: left,
    width:  right - left + 1,
    height: bottom - top + 1
  }
end


image1 = [
  [1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 0, 0, 0, 1],
  [1, 1, 1, 0, 0, 0, 1],
  [1, 1, 1, 1, 1, 1, 1],
]

image2 = [
  [1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 0, 0],
  [1, 1, 1, 1, 1, 0, 0],
]

p find_rectangle(image1)       # => {row: 2, column: 3, width: 3, height: 2}
p find_rectangle(image2)       # => {row: 3, column: 5, width: 2, height: 2}
p "-----------------------------------"
p find_rectangle_fast(image1)  # => {row: 2, column: 3, width: 3, height: 2}
p find_rectangle_fast(image2)  # => {row: 3, column: 5, width: 2, height: 2}


# ruby interview/mock_test/karat_demo.rb
