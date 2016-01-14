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

ActiveRecord::Schema.define(version: 20160114085929) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "short_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "country_specific_prizes", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "status"
    t.integer  "prize_category_id"
    t.integer  "country_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "country_specific_prizes", ["country_id"], name: "index_country_specific_prizes_on_country_id", using: :btree
  add_index "country_specific_prizes", ["prize_category_id"], name: "index_country_specific_prizes_on_prize_category_id", using: :btree

  create_table "gameplays", force: :cascade do |t|
    t.integer  "position_x"
    t.integer  "position_y"
    t.integer  "game_id"
    t.integer  "user_id"
    t.integer  "chance_number"
    t.boolean  "is_hit",        default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.float    "daviation"
  end

  add_index "gameplays", ["game_id"], name: "index_gameplays_on_game_id", using: :btree
  add_index "gameplays", ["user_id"], name: "index_gameplays_on_user_id", using: :btree

  create_table "games", force: :cascade do |t|
    t.string   "title"
    t.integer  "position_x"
    t.integer  "position_y"
    t.integer  "position_offset"
    t.integer  "number_of_winner",                 default: 0
    t.integer  "status"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "competition_picture_file_name"
    t.string   "competition_picture_content_type"
    t.integer  "competition_picture_file_size"
    t.datetime "competition_picture_updated_at"
  end

  create_table "prize_categories", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "amount"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
  end

  create_table "prize_redemptions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.integer  "country_specific_prize_id"
    t.integer  "status"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "prize_category_id"
  end

  add_index "prize_redemptions", ["country_specific_prize_id"], name: "index_prize_redemptions_on_country_specific_prize_id", using: :btree
  add_index "prize_redemptions", ["game_id"], name: "index_prize_redemptions_on_game_id", using: :btree
  add_index "prize_redemptions", ["prize_category_id"], name: "index_prize_redemptions_on_prize_category_id", using: :btree
  add_index "prize_redemptions", ["user_id"], name: "index_prize_redemptions_on_user_id", using: :btree

  create_table "suggestions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "subject"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "suggestions", ["user_id"], name: "index_suggestions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "nickname"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "country_id"
    t.date     "date_of_birth"
    t.integer  "diamond_count", default: 1
    t.string   "language",      default: "English"
    t.string   "secret_code"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "users", ["country_id"], name: "index_users_on_country_id", using: :btree

  add_foreign_key "country_specific_prizes", "countries"
  add_foreign_key "country_specific_prizes", "prize_categories"
  add_foreign_key "gameplays", "games"
  add_foreign_key "gameplays", "users"
  add_foreign_key "prize_redemptions", "country_specific_prizes"
  add_foreign_key "prize_redemptions", "games"
  add_foreign_key "prize_redemptions", "prize_categories"
  add_foreign_key "prize_redemptions", "users"
  add_foreign_key "suggestions", "users"
  add_foreign_key "users", "countries"
end
