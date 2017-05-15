class Snippet < ApplicationRecord
  belongs_to :user
  validates :name, :artist, :notes, presence: true

  def self.sanitize_notes
    # clean_notes = @snippet.notes.gsub(/\s+/, '').split(', ')
  end
end
