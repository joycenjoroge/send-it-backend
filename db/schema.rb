# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_06_23_060639) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "address_type"
    t.string "street"
    t.string "county"
    t.string "city"
    t.string "postal_code"
    t.bigint "parcel_order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parcel_order_id"], name: "index_addresses_on_parcel_order_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "role"
    t.string "permissions"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_admins_on_user_id"
  end

  create_table "delivery_statuses", force: :cascade do |t|
    t.string "status"
    t.bigint "parcel_order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "timestamp"
    t.index ["parcel_order_id"], name: "index_delivery_statuses_on_parcel_order_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "message"
    t.bigint "parcel_order_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parcel_order_id"], name: "index_notifications_on_parcel_order_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "parcel_items", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.decimal "weight"
    t.decimal "value"
    t.bigint "parcel_order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parcel_order_id"], name: "index_parcel_items_on_parcel_order_id"
  end

  create_table "parcel_orders", force: :cascade do |t|
    t.string "destination"
    t.string "status"
    t.string "present_location"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_parcel_orders_on_user_id"
  end

  create_table "payment_transactions", force: :cascade do |t|
    t.decimal "amount"
    t.string "payment_status"
    t.string "payment_method"
    t.bigint "parcel_order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "timestamp"
    t.index ["parcel_order_id"], name: "index_payment_transactions_on_parcel_order_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.boolean "is_admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "addresses", "parcel_orders"
  add_foreign_key "admins", "users"
  add_foreign_key "delivery_statuses", "parcel_orders"
  add_foreign_key "notifications", "parcel_orders"
  add_foreign_key "notifications", "users"
  add_foreign_key "parcel_items", "parcel_orders"
  add_foreign_key "parcel_orders", "users"
  add_foreign_key "payment_transactions", "parcel_orders"
end
