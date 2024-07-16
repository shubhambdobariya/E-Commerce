class RemoveEmilFromProducts < ActiveRecord::Migration[7.1]
  def change
    remove_column :products, :email, :string
  end
end
