class ParcelOrderSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :destination, :status, :created_at, :updated_at

  belongs_to :user
end
