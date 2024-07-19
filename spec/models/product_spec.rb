require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:category) { Category.create(name: 'Electronics') }
  let(:product) { Product.new(title: 'Phone', price: 100, compare_at_price: 150, category: category) }

  it 'is valid with valid attributes' do
    expect(product).to be_valid
  end

  it 'is not valid without a title' do
    product.title = nil
    expect(product).not_to be_valid
  end

  it 'is not valid if compare_at_price is less than or equal to price' do
    product.compare_at_price = 50
    expect(product).not_to be_valid
  end

  it 'increments price by 1 after creation' do
    product.save
    expect(product.price).to eq(101)
  end

 
end
