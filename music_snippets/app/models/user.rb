class User < ApplicationRecord
  has_secure_password
  has_many :snippets
  has_one :dashboard
  validates :username, :email, presence: true
  validates_uniqueness_of :email, { message: "This email address is already subscribed, please log in or try again." }
  validates_length_of :password, minimum: 4, too_short: "Password should be at least 4 characters, please try again."
end
