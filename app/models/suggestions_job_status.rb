class SuggestionsJobStatus < ApplicationRecord
  validates :done, inclusion: { in: [true, false] }
  validates :done, exclusion: { in: [nil] }
end
