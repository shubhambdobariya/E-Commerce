class Developer < ApplicationRecord
  belongs_to:user
  has_and_belongs_to_many :projects
  has_many :ticket_assigns, dependent: :destroy
  has_many :tickets, through: :ticket_assigns
  validates :name, presence: true
  validates :position, presence: true
end

