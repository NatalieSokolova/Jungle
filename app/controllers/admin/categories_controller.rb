class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @product = Category.new
  end

  def create
    @product = Category.new(product_params)

    if @product.save
      redirect_to [:admin, :products], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name,
      :created_at,
      :updated_at
    )
  end

  http_basic_authenticate_with :name => ENV['username'], :password => ENV['password']
end
