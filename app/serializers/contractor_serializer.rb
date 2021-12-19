class ContractorSerializer < ActiveModel::Serializer
  attributes :id, :business_name, :license_number, :appointments
end
