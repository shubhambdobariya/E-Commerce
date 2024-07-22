class Category < ApplicationRecord
  belongs_to :user
  has_many :products
  validates :name, presence: true
  has_many :p, class_name: "Product"
end
