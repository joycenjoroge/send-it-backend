class Notification < ApplicationRecord
    belongs_to :user
    belongs_to :parcel_order
end
