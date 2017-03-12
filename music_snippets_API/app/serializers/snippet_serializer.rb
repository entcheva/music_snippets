class SnippetSerializer < ActiveModel::Serializer
  attributes :id, :name, :artist, :notes, :user_id
  belongs_to :user
end
