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

ActiveRecord::Schema.define(version: 20160204140406) do

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "short_code", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "country_specific_prizes", force: :cascade do |t|
    t.integer  "amount",            limit: 4
    t.integer  "status",            limit: 4
    t.integer  "prize_category_id", limit: 4
    t.integer  "country_id",        limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "country_specific_prizes", ["country_id"], name: "index_country_specific_prizes_on_country_id", using: :btree
  add_index "country_specific_prizes", ["prize_category_id"], name: "index_country_specific_prizes_on_prize_category_id", using: :btree

  create_table "game_pictures", force: :cascade do |t|
    t.boolean  "is_used",                                      default: false
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
    t.string   "picture_file_name",                limit: 255
    t.string   "picture_content_type",             limit: 255
    t.integer  "picture_file_size",                limit: 4
    t.datetime "picture_updated_at"
    t.string   "competition_picture_file_name",    limit: 255
    t.string   "competition_picture_content_type", limit: 255
    t.integer  "competition_picture_file_size",    limit: 4
    t.datetime "competition_picture_updated_at"
    t.integer  "game_id",                          limit: 4
  end

  add_index "game_pictures", ["game_id"], name: "index_game_pictures_on_game_id", using: :btree

  create_table "gameplays", force: :cascade do |t|
    t.integer  "position_x",    limit: 4
    t.integer  "position_y",    limit: 4
    t.integer  "game_id",       limit: 4
    t.integer  "user_id",       limit: 4
    t.integer  "chance_number", limit: 4
    t.boolean  "is_hit",                   default: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.float    "daviation",     limit: 24
  end

  add_index "gameplays", ["game_id"], name: "index_gameplays_on_game_id", using: :btree
  add_index "gameplays", ["user_id"], name: "index_gameplays_on_user_id", using: :btree

  create_table "games", force: :cascade do |t|
    t.string   "title",                            limit: 255
    t.integer  "position_x",                       limit: 4
    t.integer  "position_y",                       limit: 4
    t.integer  "position_offset",                  limit: 4
    t.integer  "number_of_winner",                 limit: 4,   default: 0
    t.integer  "status",                           limit: 4
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.string   "picture_file_name",                limit: 255
    t.string   "picture_content_type",             limit: 255
    t.integer  "picture_file_size",                limit: 4
    t.datetime "picture_updated_at"
    t.string   "competition_picture_file_name",    limit: 255
    t.string   "competition_picture_content_type", limit: 255
    t.integer  "competition_picture_file_size",    limit: 4
    t.datetime "competition_picture_updated_at"
    t.boolean  "is_active",                                    default: true
    t.datetime "played_on"
  end

  create_table "pingoo_configurations", force: :cascade do |t|
    t.string   "configuration_id", limit: 255
    t.string   "value",            limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "prize_categories", force: :cascade do |t|
    t.string   "title",             limit: 255
    t.string   "description",       limit: 255
    t.integer  "amount",            limit: 4
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "icon_file_name",    limit: 255
    t.string   "icon_content_type", limit: 255
    t.integer  "icon_file_size",    limit: 4
    t.datetime "icon_updated_at"
    t.string   "currency_unit",     limit: 255
    t.boolean  "is_active",                     default: true
  end

  create_table "prize_redemptions", force: :cascade do |t|
    t.integer  "user_id",                   limit: 4
    t.integer  "game_id",                   limit: 4
    t.integer  "country_specific_prize_id", limit: 4
    t.integer  "status",                    limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "prize_category_id",         limit: 4
  end

  add_index "prize_redemptions", ["country_specific_prize_id"], name: "index_prize_redemptions_on_country_specific_prize_id", using: :btree
  add_index "prize_redemptions", ["game_id"], name: "index_prize_redemptions_on_game_id", using: :btree
  add_index "prize_redemptions", ["prize_category_id"], name: "index_prize_redemptions_on_prize_category_id", using: :btree
  add_index "prize_redemptions", ["user_id"], name: "index_prize_redemptions_on_user_id", using: :btree

  create_table "prizes_countries", force: :cascade do |t|
    t.integer  "prize_category_id", limit: 4
    t.integer  "country_id",        limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "prizes_countries", ["country_id"], name: "index_prizes_countries_on_country_id", using: :btree
  add_index "prizes_countries", ["prize_category_id"], name: "index_prizes_countries_on_prize_category_id", using: :btree

  create_table "suggestions", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.string   "subject",     limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "suggestions", ["user_id"], name: "index_suggestions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "nickname",           limit: 255
    t.string   "email",              limit: 255
    t.string   "first_name",         limit: 255
    t.string   "last_name",          limit: 255
    t.integer  "country_id",         limit: 4
    t.date     "date_of_birth"
    t.integer  "diamond_count",      limit: 4,   default: 1
    t.string   "language",           limit: 255, default: "English"
    t.string   "secret_code",        limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.datetime "last_video_watched"
  end

  add_index "users", ["country_id"], name: "index_users_on_country_id", using: :btree

  create_table "winners", force: :cascade do |t|
    t.integer  "gameplay_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "game_id",     limit: 4
    t.integer  "user_id",     limit: 4
  end

  add_index "winners", ["game_id"], name: "index_winners_on_game_id", using: :btree
  add_index "winners", ["gameplay_id"], name: "index_winners_on_gameplay_id", using: :btree
  add_index "winners", ["user_id"], name: "index_winners_on_user_id", using: :btree

  add_foreign_key "country_specific_prizes", "countries"
  add_foreign_key "country_specific_prizes", "prize_categories"
  add_foreign_key "game_pictures", "games"
  add_foreign_key "gameplays", "games"
  add_foreign_key "gameplays", "users"
  add_foreign_key "prize_redemptions", "country_specific_prizes"
  add_foreign_key "prize_redemptions", "games"
  add_foreign_key "prize_redemptions", "prize_categories"
  add_foreign_key "prize_redemptions", "users"
  add_foreign_key "prizes_countries", "countries"
  add_foreign_key "prizes_countries", "prize_categories"
  add_foreign_key "suggestions", "users"
  add_foreign_key "users", "countries"
  add_foreign_key "winners", "gameplays"
  add_foreign_key "winners", "games"
  add_foreign_key "winners", "users"
end
