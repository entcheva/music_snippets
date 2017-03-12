class UserSerializer < ActiveModel::Serializer
  attributes :username, :email, :password_digest
  has_many :snippets
end
