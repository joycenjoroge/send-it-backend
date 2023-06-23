class Address < ApplicationRecord
    belongs_to :parcel_order
    self.inheritance_column = 'address_type_column'
    attribute :address_type, :string
end
