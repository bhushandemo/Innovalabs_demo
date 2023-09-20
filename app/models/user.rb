class User < ApplicationRecord
  has_secure_password
  has_many :blogs
  validates :email, uniqueness: true
end
