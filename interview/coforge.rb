Rails.application.routes.draw do
  get 'products/:category', to: 'products#index', constraints: lambda { |req| Product.valid_category?(req.params[:category]) }
end

# app/models/product.rb
class Product < ApplicationRecord
  def self.valid_category?(category)
    %w[electronics clothing books].include?(category)
  end
end
