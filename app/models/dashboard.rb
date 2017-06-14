class Dashboard < ApplicationRecord
  has_many :snippets
  has_many :audio_files
  has_many :wishlists
  belongs_to :user
end
