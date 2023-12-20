# ruby solutions/total_discount.rb

inp = "eggs,eggs,bread,milk,tea,bread,bread,bread,milk"
price = {"bread" => 60, "milk" => 60, "tea" => 150, "eggs" => 40}
item_discounts = {"bread" => { "3" => 150}, "eggs" => { "2" => 70}}
total_by_items ={}
items_ordered = inp.split(",").group_by(&:itself).map { |w, ws| [w, ws.length] }.to_h
total_by_items = items_ordered.merge(price) {|key,val1,val2| val1*val2}
total_price = total_by_items.values.inject { |a, b| a + b }
puts "Items Ordered are: #{items_ordered}"
puts "Total Price of all items: #{total_by_items}"
puts "Total price is : #{total_price}"