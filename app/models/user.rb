class User < ApplicationRecord
  has_secure_password
  has_many :snippets
  has_one :dashboard
  validates :username, :email, uniqueness: true
  validates :password, presence: true, on: :create
end
