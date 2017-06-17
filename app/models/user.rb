class User < ApplicationRecord
  include Clearance::User

  has_one :dashboard
  has_many :activities
  has_many :audio_files
  has_many :snippets
  has_many :wishlists

  validates :email, :username, uniqueness: true
  validates :password, presence: true, on: :create
end
