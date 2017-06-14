class Wishlist < ApplicationRecord
  belongs_to :user
  validates :artist, :title, :instrument, presence: true
end
