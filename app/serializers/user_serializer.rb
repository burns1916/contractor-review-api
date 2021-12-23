class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :meta_id, :meta_type
end
