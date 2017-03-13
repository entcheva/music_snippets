class Snippet < ApplicationRecord
  belongs_to :user

  def self.sanitize_notes
    # clean_notes = @snippet.notes.gsub(/\s+/, '').split(', ')
  end
end
