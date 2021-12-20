class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :clients, :contractors
end
