class ParcelOrder < ApplicationRecord
  belongs_to :user
  has_many :addresses
  has_many :parcel_items
  has_many :payment_transactions
  has_many :delivery_statuses
end
