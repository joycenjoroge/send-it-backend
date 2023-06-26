class User < ApplicationRecord
    has_secure_password
    has_many :parcel_orders
    has_many :notifications

    validates :password, length: { minimum: 6 }, on: :create
    validates :email, presence: true, uniqueness: true
end
