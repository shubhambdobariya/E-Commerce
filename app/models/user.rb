class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  has_many :categories
  has_many :developers
  

before_save :set_admin_flag

  private

  def set_admin_flag
    self.admin = true if email == 'shubhamd.essence@gmail.com'
  end
end
