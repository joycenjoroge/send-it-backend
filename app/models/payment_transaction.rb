class PaymentTransaction < ApplicationRecord
    belongs_to :parcel_order
end
