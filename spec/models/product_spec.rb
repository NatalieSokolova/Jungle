require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save successfully with all four fields set' do
      @category = Category.new(name: 'Home Decor')
      @product = Product.new(name: 'Candlestick', price: 39.99, quantity: 14, category: @category)
      expect(@product).to be_present
    end
  end
end
