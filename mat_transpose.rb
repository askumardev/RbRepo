# frozen_string_literal: true

mat = [[1, 2, 3], [4, 5, 6]]
puts mat.transpose.to_a

# SELECT name, COUNT(*) AS number_of_orders
# FROM  users,orders
# WHERE users.id= orders.user_id
# GROUP BY name
# ORDER BY users.id;
