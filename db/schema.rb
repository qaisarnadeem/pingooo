# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160110190119) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "short_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "country_specific_prizes", force: :cascade do |t|
    t.integer  "prize_category_id"
    t.integer  "country_id"
    t.integer  "amount"
    t.integer  "status"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "gameplays", force: :cascade do |t|
    t.integer  "position_x"
    t.integer  "position_y"
    t.integer  "game_id"
    t.integer  "user_id"
    t.integer  "chance_number"
    t.boolean  "is_hit"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "games", force: :cascade do |t|
    t.string   "title"
    t.integer  "position_x"
    t.integer  "position_y"
    t.integer  "position_offset"
    t.integer  "number_of_winners"
    t.integer  "status"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "prize_categories", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "amount"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "prize_redemptions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.integer  "country_specific_prize_id"
    t.integer  "status"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "suggestions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "subject"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "nickname"
    t.string   "email"
    t.string   "firstName"
    t.string   "lastName"
    t.integer  "country_id"
    t.date     "date_of_birth"
    t.integer  "diamond_count", default: 0
    t.string   "language",      default: "English"
    t.string   "secret_code"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

end
