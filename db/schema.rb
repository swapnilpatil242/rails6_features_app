# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_09_083152) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "add_to_cards", force: :cascade do |t|
    t.datetime "date"
    t.string "quantity"
    t.bigint "product_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_add_to_cards_on_product_id"
    t.index ["user_id"], name: "index_add_to_cards_on_user_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "district"
    t.string "state"
    t.integer "pincode"
    t.string "near_by_place"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "picture"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["title"], name: "index_categories_on_title"
  end

  create_table "favourite_lists", force: :cascade do |t|
    t.datetime "date"
    t.bigint "product_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_favourite_lists_on_product_id"
    t.index ["user_id"], name: "index_favourite_lists_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "date"
    t.string "org_number"
    t.string "status", null: false, comment: "processing/shipping/delivered/rejected"
    t.integer "quantity"
    t.integer "price"
    t.integer "discount"
    t.text "status_comment"
    t.text "description"
    t.bigint "user_id", null: false
    t.bigint "product_id", null: false
    t.bigint "payment_method_id", null: false
    t.bigint "address_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_orders_on_address_id"
    t.index ["date"], name: "index_orders_on_date"
    t.index ["payment_method_id"], name: "index_orders_on_payment_method_id"
    t.index ["product_id"], name: "index_orders_on_product_id"
    t.index ["status"], name: "index_orders_on_status"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string "payment_type", null: false, comment: "card/upi/net"
    t.integer "card_no"
    t.string "card_name"
    t.string "upi_address"
    t.integer "account_no"
    t.string "account_name"
    t.string "account_bank"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_payment_methods_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "quantity"
    t.integer "price"
    t.string "picture"
    t.boolean "is_active"
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["is_active"], name: "index_products_on_is_active"
    t.index ["name"], name: "index_products_on_name"
    t.index ["quantity"], name: "index_products_on_quantity"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.integer "age"
    t.string "profile_pic"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email"
  end

  add_foreign_key "add_to_cards", "products"
  add_foreign_key "add_to_cards", "users"
  add_foreign_key "addresses", "users"
  add_foreign_key "favourite_lists", "products"
  add_foreign_key "favourite_lists", "users"
  add_foreign_key "orders", "addresses"
  add_foreign_key "orders", "payment_methods"
  add_foreign_key "orders", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "payment_methods", "users"
  add_foreign_key "products", "categories"
end
