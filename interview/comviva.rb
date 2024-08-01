arr = [1, 2, 3, 7, 4, 5, 6]
index = 3
new_arr = []
# Move elements from the end to the beginning using pop and unshift
while index < arr.length
  new_arr.unshift(arr.pop)
  # 1st iteration: arr.pop returns 6, new1.unshift(6) makes new1 = [6]
  # 2nd iteration: arr.pop returns 5, new1.unshift(5) makes new1 = [5, 6]
  # 3rd iteration: arr.pop returns 4, new1.unshift(4) makes new1 = [4, 5, 6]
  # 4th iteration: arr.pop returns 7, new1.unshift(7) makes new1 = [7, 4, 5, 6]
end
 p new_arr
# Add the remaining elements in the original order
new_arr += arr
p new_arr



# arr = [1, 2, 3, 7, 4, 5, 6]
# index = 3

# new1 = []
# while index < arr.length
#   new1 << arr[index]
#   index += 1
# end

# new1.each do |element|
#   arr.delete(element)
# end
# new1 += arr
# p new1



# Write an SQL / Rails query for below tables.
# Product - name, description and colour
# Price - product_id, price, currency
# Output: Name, Description, Price and Currency of all products.

#@result = Product.joins(:price).select(:name, :description, :price, :currency)

# products = Product.joins(:price).select("products.name, products.description, prices.price, prices.currency")

# products.each do |product|
#   puts "Name: #{product.name}, Description: #{product.description}, Price: #{product.price}, 
#         Currency: #{product.currency}"
# end