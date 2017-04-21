class User < ApplicationRecord
  has_secure_password
  has_many :snippets
  has_one :dashboard
  validates :password, presence: true, on: :create
end
