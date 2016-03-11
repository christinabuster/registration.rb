class User < ActiveRecord::Base
  has_many :phones
  validates :user_name, uniqueness: true
  validates :user_name, presence: true
  validates :password, presence: true
end
