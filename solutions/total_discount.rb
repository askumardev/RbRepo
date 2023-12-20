# ruby solutions/total_discount.rb

items = {"bread" => 60, "milk" => 60 , "tea" => 150, "eggs" => 40}
item_discounts = {"bread" => { "3" => 150}, "eggs" => { "2" => 70}}
inp = "eggs,eggs,bread,milk,tea,bread,bread,bread,milk"
order_items = inp.split(",").each_with_object(Hash.new(0)){|k,v| v[k] += 1}
puts order_items
savings = 0
total = 0
order_items.each do |k,v|
  if item_discounts[k]
    item_disc_qty = item_discounts[k].keys.first.to_i #dicount qty
    rem = v.divmod(item_disc_qty)
    total += ((rem[0]*item_discounts[k].values[0]) + (rem[1]*items[k]))
    savings += (v*items[k] - (rem[0]*item_discounts[k].values[0] + rem[1]*items[k])) if rem[0] > 0
  else
    total += v*items[k]
  end
end
puts "Total: #{total}"
puts "Savings: #{savings}"

# inp = "eggs,eggs,bread,milk,tea,bread,bread,bread,milk"
# price = {"bread" => 60, "milk" => 60, "tea" => 150, "eggs" => 40}
# item_discounts = {"bread" => { "3" => 150}, "eggs" => { "2" => 70}}
# total_by_items ={}
# items_ordered = inp.split(",").group_by(&:itself).map { |w, ws| [w, ws.length] }.to_h
# total_by_items = items_ordered.merge(price) {|key,val1,val2| val1*val2}
# total_price = total_by_items.values.inject { |a, b| a + b }
# puts "Items Ordered are: #{items_ordered}"
# puts "Total Price of all items: #{total_by_items}"
# puts "Total price is : #{total_price}"