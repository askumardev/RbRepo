module A

    def add

        "addition of single digits"

    end

end

module B

    def add

        "addition of double digits"

    end

end

class addition

    include A
    prepend B

    def add

        Additionn on multiple digits"

    end

end

obj = Addition.new

obj.add
class OrdersController < ApplicationController
   def checkout
     order = Order.new(order_params)
     if order.save
       # Business logic inside controller
       discount = Discount.find_by(code: params[:discount_code])
       if discount && discount.active?
         order.total_price = order.total_price - (order.total_price * discount.percent / 100)
         order.save
       end
      # Email sending inline
       UserMailer.confirmation(order.user, order).deliver_now
      # Inventory update inline
       order.items.each do |item|
         product = Product.find(item.product_id)
         product.stock = product.stock - item.quantity
         product.save
       end
      # Reporting logic inside controller
       File.open("report.csv", "w") do |f|
         f.puts "Order ID, Total Price"
         f.puts "#{order.id}, #{order.total_price}"
       end
      redirect_to order_path(order)
     else
       render :new
     end
   end
  private
  def order_params
     params.require(:order).permit(:user_id, items_attributes: [:product_id, :quantity])
   end
end
