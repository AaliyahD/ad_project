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

ActiveRecord::Schema.define(version: 20160314043620) do

  create_table "administrators", force: true do |t|
    t.string   "fullname"
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "message"
    t.boolean  "status"
    t.integer  "post_id"
    t.integer  "visitor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id"
  add_index "comments", ["visitor_id"], name: "index_comments_on_visitor_id"

  create_table "diarylogs", force: true do |t|
    t.string   "meal_type"
    t.text     "description"
    t.integer  "calories"
    t.integer  "sugar"
    t.integer  "fat"
    t.integer  "sodium"
    t.integer  "sat_fat"
    t.integer  "fiber"
    t.date     "date"
    t.time     "time"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "carbs"
    t.integer  "protein"
    t.text     "feedback"
  end

  add_index "diarylogs", ["user_id"], name: "index_diarylogs_on_user_id"

  create_table "messages", force: true do |t|
    t.text     "content"
    t.integer  "visitor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "status",     default: false, null: false
    t.integer  "user_id"
    t.text     "subject"
    t.text     "response"
  end

  add_index "messages", ["visitor_id"], name: "index_messages_on_visitor_id"

  create_table "notifications", force: true do |t|
    t.integer  "notifiable_id"
    t.string   "notifiable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["notifiable_id", "notifiable_type"], name: "index_notifications_on_notifiable_id_and_notifiable_type"

  create_table "post_tags", force: true do |t|
    t.integer  "post_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_tags", ["post_id"], name: "index_post_tags_on_post_id"
  add_index "post_tags", ["tag_id"], name: "index_post_tags_on_tag_id"

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.boolean  "publish"
    t.integer  "administrator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "image"
  end

  add_index "posts", ["administrator_id"], name: "index_posts_on_administrator_id"

  create_table "settings", force: true do |t|
    t.string   "site_name"
    t.integer  "post_per_page"
    t.boolean  "under_maintenance"
    t.boolean  "prevent_commenting"
    t.boolean  "tag_visibility"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "name",                   default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.text     "about"
    t.date     "birthday"
    t.text     "hobbies"
    t.text     "advice"
    t.string   "height"
    t.string   "starting_weight"
    t.string   "current_weight"
    t.string   "location"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "visitors", force: true do |t|
    t.string   "fullname"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
