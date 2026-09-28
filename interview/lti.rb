# spec/controllers/orders_controller_spec.rb

# require 'rails_helper'

# describe OrdersController do
#   before(:all) do
#     @user = User.create!(email: "satish@example.com", password: "secret123")
#     @product = Product.create!(title: "Annual Plan", price_cents: 10_000)
#   end

#   before(:each) do
#     session[:user_id] = @user.id
#   end

#   it "creates an order and charges the customer" do
#     post :create, params: { product_id: @product.id, amount: 100 }
#     expect(Order.count).to eq(1)
#     expect(response.status).to eq(302)
#     expect(PaymentGateway.charge(@user, 100)).to be_truthy
#     expect(Order.last.status).to eq("paid")
#   end


#   it "sends a confirmation email" do
#     post :create, params: { product_id: @product.id, amount: 100 }
#     expect(ActionMailer::Base.deliveries.last.to).to eq([@user.email])
#   end
# end


# Order.where(status: "pending").each do |order|
#   puts order.customer.name
#   order.line_items.each { |li| puts li.product.title }
# end



# ruby interview/lti.rb
p "------------with prepend-----------------"
module M
  def save
    p "M"
  end
end

class A
  def save
    p "A"
  end
end

class B < A
  #include M
  prepend M
end

b = B.new
b.save
p b.class.ancestors


p "------------with include-----------------"

module M1
  def save
    p "M1"
  end
end

class A1
  def save
    p "A1"
  end
end

class B1 < A1
  include M1
end


b1 = B1.new
b1.save
p b1.class.ancestors
