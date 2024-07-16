# app/models/project.rb
class Project < ApplicationRecord
  has_and_belongs_to_many :developers
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :tickets, dependent: :destroy

  enum status: { progress: 0, completed: 1, pending: 2, New: 3 }

  validates :project_name, presence: true
  validates :status, presence: true
  validates :start_date, presence: true

  delegate :name, to: :first_developer, prefix: true, allow_nil: true

  def first_developer
    developers.first
  end
end
