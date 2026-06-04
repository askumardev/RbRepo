# ruby interview/wipro.rb

module A
  def add
    p "addition of single digits"
  end
end

module B
  def add
    p "addition of double digits"
  end
end

class Addition
  include A
  prepend B

  def add
    p  "Additionn on multiple digits"
  end
end

obj = Addition.new
obj.add

p Addition.ancestors
p "-----------------------------------------"
class Person
  def greet
    puts "hello"
  end
end

class Person
  def bye
    puts "goodbye"
  end
  def greet
    puts "hello...goodbye"
  end
end
Person.new.greet
Person.new.bye

#---------------------------------------
# Class.superclass
# => Module
# irb(main):002:0> Class.superclass.superclass
# => Object
# irb(main):003:0> Class.superclass.superclass.superclass
# => BasicObject
# -------------------------------------
# class OrdersController < ApplicationController
#    def checkout
#      order = Order.new(order_params)
#      if order.save
#        # Business logic inside controller
#        discount = Discount.find_by(code: params[:discount_code])
#        if discount && discount.active?
#          order.total_price = order.total_price - (order.total_price * discount.percent / 100)
#          order.save
#        end
#       # Email sending inline
#        UserMailer.confirmation(order.user, order).deliver_now
#       # Inventory update inline
#        order.items.each do |item|
#          product = Product.find(item.product_id)
#          product.stock = product.stock - item.quantity
#          product.save
#        end
#       # Reporting logic inside controller
#        File.open("report.csv", "w") do |f|
#          f.puts "Order ID, Total Price"
#          f.puts "#{order.id}, #{order.total_price}"
#        end
#       redirect_to order_path(order)
#      else
#        render :new
#      end
#    end
#   private
#   def order_params
#      params.require(:order).permit(:user_id, items_attributes: [:product_id, :quantity])
#    end
# end

#---------------final code------------------------------
OrdersController
class OrdersController < ApplicationController
  before_action :authenticate_user!

  def checkout
    @order = OrderCheckoutService.new(
      current_user,
      order_params,
      params[:discount_code]
    ).call

    redirect_to order_path(@order),
                notice: "Order placed successfully"
  rescue StandardError => e
    flash[:alert] = e.message
    render :new, status: :unprocessable_entity
  end

  private

  def order_params
    params.require(:order)
          .permit(
            order_items_attributes: [
              :product_id,
              :quantity
            ]
          )
  end
end

OrderCheckoutService
class OrderCheckoutService
  def initialize(user, order_params, discount_code)
    @user = user
    @order_params = order_params
    @discount_code = discount_code
  end

  def call
    Order.transaction do
      create_order
      apply_discount
      update_inventory

      UserMailer.confirmation(@user, @order)
                .deliver_later

      @order
    end
  end

  private

  attr_reader :user,
              :order_params,
              :discount_code

  def create_order
    @order = user.orders.create!(order_params)

    total_price =
      @order.order_items.sum do |item|
        item.product.price * item.quantity
      end

    @order.update!(total_price: total_price)
  end

  def apply_discount
    return if discount_code.blank?

    discount = Discount.find_by(code: discount_code)

    raise "Invalid discount code" unless discount
    raise "Discount is inactive" unless discount.active?

    discounted_price =
      @order.total_price -
      (@order.total_price * discount.percent / 100.0)

    @order.update!(total_price: discounted_price)
  end

  def update_inventory
    @order.order_items.includes(:product).each do |item|
      product = item.product

      product.with_lock do
        if product.stock < item.quantity
          raise "#{product.name} is out of stock"
        end

        product.update!(
          stock: product.stock - item.quantity
        )
      end
    end
  end
end
Order Model
class Order < ApplicationRecord
  belongs_to :user

  has_many :order_items,
           dependent: :destroy

  accepts_nested_attributes_for :order_items

  validates :total_price,
            numericality: {
              greater_than_or_equal_to: 0
            }
end
OrderItem Model
class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity,
            numericality: {
              greater_than: 0
            }
end
Product Model
class Product < ApplicationRecord
  has_many :order_items

  validates :stock,
            numericality: {
              greater_than_or_equal_to: 0
            }

  validates :price,
            numericality: {
              greater_than: 0
            }
end
Discount Model
class Discount < ApplicationRecord
  validates :code, presence: true

  def active?
    is_active &&
      (expires_at.nil? || expires_at.future?)
  end
end
UserMailer
class UserMailer < ApplicationMailer
  def confirmation(user, order)
    @user = user
    @order = order

    mail(
      to: @user.email,
      subject: "Order Confirmation"
    )
  end
end
#-------------------------------------------------------

# Here are concise bullet points you can mention during a Rails code review or interview when asked how to improve the OrdersController:

# Controller Design
# Move business logic to a Service Object (OrderCheckoutService).
# Keep controllers thin and focused on handling requests/responses.
# Follow the Single Responsibility Principle (SRP).

# Database Transactions
# Wrap order creation, discount application, and inventory updates in a database transaction.
# Use save! instead of save inside transactions to raise exceptions on failures.
# Ensure all operations either succeed together or rollback together.

# Authentication & Authorization
# Add before_action :authenticate_user!.
# Use current_user instead of accepting user_id from params.
# Implement authorization using gems like Pundit or CanCanCan.

# Inventory Management
# Validate stock availability before creating the order.
# Prevent negative inventory values.
# Use database locking (with_lock) to avoid race conditions.
# Consider optimistic/pessimistic locking for concurrent purchases.

# Query Optimization
# Avoid N+1 queries when loading products.
# Use includes(:product) or eager loading where appropriate.
# Minimize unnecessary database calls.

# Email Processing
# Replace deliver_now with deliver_later.
# Send emails asynchronously using Active Job and Sidekiq/Resque.
# Prevent checkout delays caused by email delivery failures.

# Error Handling
# Add proper exception handling using rescue_from.
# Log errors for debugging and monitoring.
# Show user-friendly error messages.

# Discount Handling
# Validate discount expiration dates.
# Check usage limits and eligibility rules.
# Prevent discounts from making order totals negative.
# Move discount calculations to a dedicated service/model.

# Reporting
# Do not generate files directly inside controllers.
# Move report generation to background jobs.
# Store reports in cloud storage or dedicated reporting systems.

# Security
# Use strong parameters consistently.
# Never trust user_id from request parameters.
# Validate all user inputs.
# Protect against parameter tampering.

# Performance
# Avoid multiple saves on the same record.
# Use bulk updates where possible.
# Offload heavy operations to background jobs.

# Logging & Monitoring
# Log important checkout events.
# Track inventory changes.
# Monitor failed payments and order processing errors.
# Integrate with monitoring tools like Sentry or New Relic.

# Testing
# Add controller/request specs.
# Add service object specs.
# Test inventory updates and discount calculations.
# Test transaction rollbacks.
# Test concurrent order scenarios.


# Recommended Architecture
# OrdersController
#         ↓
# OrderCheckoutService
#         ↓
# --------------------------------
# | Create Order                |
# | Apply Discount              |
# | Validate Stock              |
# | Update Inventory            |
# | Send Email (Background Job) |
# | Generate Report (Job)       |
# --------------------------------


# Interview Summary
# A senior Rails developer would typically:
# Keep the controller thin.
# Use Service Objects.
# Use database transactions.
# Process emails and reports in background jobs.
# Add authentication and authorization.
# Prevent race conditions in inventory updates.
# Optimize queries and error handling.
# Ensure the checkout flow is scalable, secure, and maintainable.
