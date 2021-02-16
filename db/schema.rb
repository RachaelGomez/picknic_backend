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

ActiveRecord::Schema.define(version: 2021_02_16_025753) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "details", force: :cascade do |t|
    t.string "price"
    t.string "url"
    t.string "phone"
    t.string "image_url"
    t.string "name"
    t.float "rating"
    t.string "yelp_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "host_id"
    t.string "group_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "host_name"
    t.boolean "is_started", default: false, null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "yelp_id"
    t.integer "group_id"
    t.string "restaurant_name"
    t.integer "rating"
    t.string "price"
    t.string "image_url"
    t.text "transactions", default: ""
    t.text "categories"
    t.string "city"
    t.string "state"
    t.string "address_1"
    t.string "zipcode"
  end

  create_table "users", force: :cascade do |t|
    t.string "google_id"
    t.integer "group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
  end

  create_table "votes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "restaurant_id"
    t.boolean "is_right"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
