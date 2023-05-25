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

ActiveRecord::Schema[7.0].define(version: 2023_05_25_004826) do
  create_table "extractions", force: :cascade do |t|
    t.date "date"
    t.string "plant"
    t.string "product"
    t.string "campaign"
    t.string "stage"
    t.string "tank"
    t.decimal "concentration", precision: 10, scale: 2
    t.decimal "volume", precision: 15, scale: 2
    t.decimal "weight", precision: 15, scale: 2
    t.decimal "level", precision: 15, scale: 2
    t.decimal "ph", precision: 15, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fermentations", force: :cascade do |t|
    t.date "date"
    t.string "plant"
    t.string "product"
    t.string "campaign"
    t.string "stage"
    t.string "tank"
    t.decimal "level"
    t.decimal "weight"
    t.decimal "received"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.string "message"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "packagings", force: :cascade do |t|
    t.date "date"
    t.string "plant"
    t.string "product"
    t.string "campaign"
    t.string "packages"
    t.decimal "incoming"
    t.decimal "outgoing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tokens", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "value"
    t.datetime "expiry"
    t.string "ip"
    t.datetime "revocation_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tokens_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.string "department"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "tokens", "users"
end
