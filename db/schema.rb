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

ActiveRecord::Schema.define(version: 2020_12_23_023549) do

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.date "intake"
    t.date "expiration"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "in_use", default: false
    t.string "unit_of_measurement"
    t.decimal "cost", precision: 15, scale: 2
    t.decimal "amount_in_stock", precision: 15, scale: 3
    t.decimal "amount_used", precision: 15, scale: 3
  end

  create_table "line_items", force: :cascade do |t|
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "menu_item_id", null: false
    t.decimal "line_item_subtotal", precision: 15, scale: 2
    t.integer "cart_id"
    t.index ["menu_item_id"], name: "index_line_items_on_menu_item_id"
  end

  create_table "menu_ingredient_joins", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "menu_item_id", null: false
    t.integer "ingredient_id", null: false
    t.index ["ingredient_id"], name: "index_menu_ingredient_joins_on_ingredient_id"
    t.index ["menu_item_id"], name: "index_menu_ingredient_joins_on_menu_item_id"
  end

  create_table "menu_items", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "description"
    t.string "category", default: "", null: false
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "price", precision: 15, scale: 2
  end

  create_table "orders", force: :cascade do |t|
    t.integer "line_item_id", null: false
    t.integer "cart_id", null: false
    t.decimal "tax", precision: 6, scale: 2
    t.string "tax_rate"
    t.boolean "delivery", default: false
    t.decimal "delivery_fee", precision: 6, scale: 2
    t.decimal "subtotal", precision: 6, scale: 2, default: "0.0"
    t.decimal "total", precision: 6, scale: 2, default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "session_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "cart_id"
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.boolean "employee", default: false
    t.boolean "manager", default: false
    t.string "provider", limit: 50, default: "", null: false
    t.string "uid", limit: 500, default: "", null: false
    t.string "address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "line_items", "menu_items"
  add_foreign_key "menu_ingredient_joins", "ingredients"
  add_foreign_key "menu_ingredient_joins", "menu_items"
end
