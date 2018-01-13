class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :access_token, :created_at, :updated_at
  # has_many :scores
end
