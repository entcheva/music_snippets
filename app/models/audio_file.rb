class AudioFile < ApplicationRecord
  belongs_to :user
  has_one :activity, dependent: :destroy, as: :subject
  validates :artist, :title, :audio, presence: true
  has_attached_file :audio, attachment_presence: true
  validates_attachment_content_type :audio, content_type: /\Aaudio\/.*\z/
end
