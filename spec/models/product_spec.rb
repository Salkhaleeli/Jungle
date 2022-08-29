require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save a product' do
      @product = Product.new(
        :name => 'plant',
        :quantity => 10,
        :price => 100,
        :category => Category.new
      )
      @product.validate
      expect(@product.errors.full_messages).to be_empty
    end
    it 'should have name' do
      @product = Product.new(
        :quantity => 10,
        :price => 100,
        :category => Category.new
      )
      @product.validate
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it 'should have quantity' do
      @product = Product.new(
        :name => 'plant',
        :price => 100,
        :category => Category.new
      )
      @product.validate
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it 'should save a price' do
      @product = Product.new(
        :name => 'plant',
        :quantity => 10,
        :category => Category.new
      )
      @product.validate
      expect(@product.errors.full_messages).to include("Price cents is not a number", "Price is not a number", "Price can't be blank")
    end
    it 'should save a product' do
      @product = Product.new(
        :name => 'plant',
        :quantity => 10,
        :price => 100,
      )
      @product.validate
      expect(@product.errors.full_messages).to include("Category must exist", "Category can't be blank")
    end
  end
end
