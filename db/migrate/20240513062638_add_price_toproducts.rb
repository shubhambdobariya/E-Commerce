class AddPriceToproducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :price, :float
  end
end
