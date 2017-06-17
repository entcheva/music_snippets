class Snippet < ApplicationRecord
  belongs_to :user
  has_one :activity, dependent: :destroy, as: :subject
  validates :artist, :title, :notes, presence: true
end
