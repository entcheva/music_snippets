class SnippetSerializer < ActiveModel::Serializer
  attributes :id, :name, :artist, :notes, :date, :user_id
end
