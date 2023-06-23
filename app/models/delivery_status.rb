class DeliveryStatus < ApplicationRecord
    belongs_to :parcel_order
end
