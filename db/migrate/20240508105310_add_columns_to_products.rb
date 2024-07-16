class AddColumnsToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :email, :string
  end
end
