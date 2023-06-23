# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Seed data for Users table
User.create(name: "John Doe", email: "john@example.com", password: "password123", is_admin: false)
User.create(name: "Admin User", email: "admin@example.com", password: "adminpass456", is_admin: true)

# Seed data for ParcelOrders table
parcel_order_1 = User.first.parcel_orders.create(destination: "Moi Avenue St, CityA, StateA, PostalCodeA", status: "pending", present_location: "Warehouse")
parcel_order_2 = User.first.parcel_orders.create(destination: "Kenyatta St, CityB, StateB, PostalCodeB", status: "in progress", present_location: "In Transit")

# Seed data for Addresses table
parcel_order_1.addresses.create(address_type: "pickup", street: "Moi Avenue St", city: "CityA", county: "Nairobi", postal_code: "PostalCodeA")
parcel_order_1.addresses.create(address_type: "destination", street: "Kaunda St", city: "CityA", county: "Nakuru", postal_code: "PostalCodeA")
parcel_order_2.addresses.create(address_type: "pickup", street: "Kenyatta St", city: "CityB", county: "Mombasa", postal_code: "PostalCodeB")
parcel_order_2.addresses.create(address_type: "destination", street: "Mama Ngina St", city: "CityB", county: "Kisumu", postal_code: "PostalCodeB")

# Seed data for ParcelItems table
parcel_order_1.parcel_items.create(name: "Book", quantity: 2, weight: 1.5, value: 25.99)
parcel_order_2.parcel_items.create(name: "Electronics", quantity: 1, weight: 4.2, value: 499.99)

# Seed data for PaymentTransactions table
parcel_order_1.payment_transactions.create(amount: 35.99, payment_status: "paid", payment_method: "credit_card", timestamp: DateTime.now)
parcel_order_2.payment_transactions.create(amount: 499.99, payment_status: "paid", payment_method: "paypal", timestamp: DateTime.now)

# Seed data for Notifications table
User.first.notifications.create(parcel_order: parcel_order_1, message: "Your parcel order is in transit. Expected delivery: 2023-06-18")
User.first.notifications.create(parcel_order: parcel_order_2, message: "Your parcel order has been delivered.")

# Seed data for DeliveryStatuses table
parcel_order_1.delivery_statuses.create(status: "pending", timestamp: DateTime.now)
parcel_order_2.delivery_statuses.create(status: "in progress", timestamp: DateTime.now)
