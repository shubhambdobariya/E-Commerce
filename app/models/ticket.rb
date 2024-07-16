class Ticket < ApplicationRecord
  belongs_to :project
  has_many :ticket_assigns, dependent: :destroy
  has_many :developers, through: :ticket_assigns
  enum status: { inprogress: 0, completed: 1, todo: 2 }
  validates :title, presence: true
  validates :status, presence: true
  validates :description, presence: true
  validates :project_id, presence: true
end
