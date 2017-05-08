class User < ApplicationRecord
  include Clearance::User

  has_many :snippets
  has_one :dashboard

  validates :email, :username, uniqueness: true
  validates :password, presence: true, on: :create
end
