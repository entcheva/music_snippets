class AudioFile < ApplicationRecord
  belongs_to :user
  validates :artist, :title, :audio, presence: true
  has_attached_file :audio, attachment_presence: true
  validates_attachment_content_type :audio, content_type: "audio/mpeg"
end
