class Wishlist < ApplicationRecord
  belongs_to :user
  has_one :activity, dependent: :destroy, as: :subject
  validates :artist, :title, :instrument, presence: true
end
