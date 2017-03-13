class User < ApplicationRecord
  has_secure_password
  has_many :snippets
  has_one :dashboard
end
