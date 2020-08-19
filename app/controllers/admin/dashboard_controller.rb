class Admin::DashboardController < ApplicationController
  def show
    @product_quantity = Product.count
    @category_quantity = Category.count
  end
  
  http_basic_authenticate_with :name => ENV['username'], :password => ENV['password']
end
