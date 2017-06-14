class AudioFiles < ApplicationRecord
  belongs_to :user
  validates :artist, :title, :audio, presence: true
  has_attached_file :audio
  validates_attachment_content_type :audio, content_type: ".mp3"
end
