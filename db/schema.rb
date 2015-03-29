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

ActiveRecord::Schema.define(version: 0) do

  create_table "comments", force: true do |t|
    t.integer  "user_id",                   null: false
    t.integer  "music_id"
    t.integer  "community_id"
    t.string   "description",  limit: 1000, null: false
    t.datetime "created_at",                null: false
  end

  add_index "comments", ["community_id"], name: "community_id", using: :btree
  add_index "comments", ["music_id"], name: "music_id", using: :btree
  add_index "comments", ["user_id"], name: "user_id", using: :btree

  create_table "communities", force: true do |t|
    t.integer  "genre_id",                    null: false
    t.string   "community_name", limit: 50,   null: false
    t.string   "description",    limit: 2000, null: false
    t.datetime "created_at",                  null: false
  end

  add_index "communities", ["genre_id"], name: "genre_id", using: :btree

  create_table "genres", force: true do |t|
    t.string "genre_name", limit: 50, null: false
  end

  create_table "messages", force: true do |t|
    t.integer  "recipient_user_id",              null: false
    t.integer  "sender_user_id",                 null: false
    t.string   "title",             limit: 50,   null: false
    t.string   "body",              limit: 1000, null: false
    t.datetime "created_at",                     null: false
  end

  add_index "messages", ["recipient_user_id"], name: "recipient_user_id", using: :btree
  add_index "messages", ["sender_user_id"], name: "sender_user_id", using: :btree

  create_table "musics", force: true do |t|
    t.integer  "genre_id",                     null: false
    t.integer  "user_id",                      null: false
    t.string   "song_title",      limit: 100,  null: false
    t.string   "music_file_pass", limit: 100,  null: false
    t.string   "description",     limit: 2000
    t.datetime "created_at",                   null: false
  end

  add_index "musics", ["genre_id"], name: "genre_id", using: :btree
  add_index "musics", ["user_id"], name: "user_id", using: :btree

  create_table "schema_info", id: false, force: true do |t|
    t.integer "version", default: 0, null: false
  end

  create_table "users", force: true do |t|
    t.string   "email",                               default: "",           null: false
    t.string   "encrypted_password",                  default: "",           null: false
    t.string   "user_name",              limit: 50,                          null: false
    t.string   "first_name",             limit: 50,                          null: false
    t.string   "last_name",              limit: 50,                          null: false
    t.string   "country",                limit: 50
    t.string   "city",                   limit: 50
    t.string   "description",            limit: 1000
    t.string   "image_path",             limit: 200,  default: "sample.jpg", null: false
    t.datetime "created_at",                                                 null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       default: 0,            null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
