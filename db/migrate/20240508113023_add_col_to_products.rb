class AddColToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :title, :string
    add_column :products, :description, :string
    add_column :products, :price, :float
    add_column :products, :compare_at_price, :float
  end
end
