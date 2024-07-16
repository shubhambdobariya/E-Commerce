class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :category, foreign_key: :category_id, class_name: 'Category'
  has_many :comments, as: :commentable, dependent: :destroy

  validates :title, presence: true
  validates :compare_at_price, numericality: { greater_than: :price }

  after_create :increment_price

  delegate :name, :description, to: :category, prefix: true, allow_nil: true

  private

  def increment_price
    self.price += 1
    self.save
  end
end
