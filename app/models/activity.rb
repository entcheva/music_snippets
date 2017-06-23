class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :subject, polymorphic: true

  enum status: {
    created: 0,
    updated: 1,
  }
end
