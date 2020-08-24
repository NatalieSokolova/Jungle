require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save successfully with all four fields set' do
      # .create Creates an object (or multiple objects) and saves it to the database, if validations pass. The resulting object is returned whether the object was saved successfully to the database or not, while .new only creates the local object but does not attempt to validate or save it to the DB.
      @category = Category.create(name: 'Home Decor')
      @product = Product.create(name: 'Candlestick', price: 39.99, quantity: 14, category: @category)
      expect(@product).to be_present
    end

    it 'shuold not save with name missing' do
      @category = Category.create(name: 'Home Decor')
      @product = Product.create(name: nil, price: 39.99, quantity: 14, category: @category)
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end

    it 'shuold not save with price missing' do
      @category = Category.create(name: 'Home Decor')
      @product = Product.create(name: 'Candlestick', price: nil, quantity: 14, category: @category)
      expect(@product.errors.full_messages).to include "Price can't be blank"
    end

    it 'shuold not save with quantity missing' do
      @category = Category.create(name: 'Home Decor')
      @product = Product.create(name: 'Candlestick', price: 39.99, quantity: nil, category: @category)
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end

    it 'shuold not save with category missing' do
      @category = Category.create(name: 'Home Decor')
      @product = Product.create(name: 'Candlestick', price: 39.99, quantity: 14, category: nil)
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end
  end
end
