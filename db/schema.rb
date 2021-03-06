# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180919144828) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "citext"

  create_table "bars", force: :cascade do |t|
    t.citext "name"
    t.citext "address"
    t.string "longitude"
    t.string "latitude"
    t.json "open", default: {}
    t.json "close", default: {}
    t.json "hh_start", default: {}
    t.json "hh_end", default: {}
    t.text "message"
    t.json "deals", default: {}
    t.citext "owner_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "choices", force: :cascade do |t|
    t.boolean "click"
    t.bigint "user_id"
    t.bigint "bar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bar_id"], name: "index_choices_on_bar_id"
    t.index ["user_id"], name: "index_choices_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.bigint "user_id"
    t.string "longitude"
    t.string "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "user_bars", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "bar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bar_id"], name: "index_user_bars_on_bar_id"
    t.index ["user_id"], name: "index_user_bars_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uid"
    t.citext "email"
    t.string "last_location"
    t.string "last_long"
    t.string "last_lat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_users_on_uid"
  end

  add_foreign_key "choices", "bars"
  add_foreign_key "choices", "users"
  add_foreign_key "locations", "users"
  add_foreign_key "user_bars", "bars"
  add_foreign_key "user_bars", "users"
end
