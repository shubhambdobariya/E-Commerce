class Category < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  has_many :p, class_name: "Product"
end
