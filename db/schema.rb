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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130217124021) do

  create_table "biographies", :force => true do |t|
    t.integer  "member_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "instrument"
    t.text     "biography"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "members", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "members", ["email"], :name => "index_members_on_email", :unique => true
  add_index "members", ["reset_password_token"], :name => "index_members_on_reset_password_token", :unique => true

  create_table "spud_admin_permissions", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.boolean  "access"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "scope"
  end

  create_table "spud_photo_albums", :force => true do |t|
    t.string   "title"
    t.string   "url_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "spud_photo_albums", ["url_name"], :name => "index_spud_photo_albums_on_url_name"

  create_table "spud_photo_albums_photos", :force => true do |t|
    t.integer "spud_photo_album_id"
    t.integer "spud_photo_id"
    t.integer "order",               :default => 0
  end

  add_index "spud_photo_albums_photos", ["spud_photo_album_id"], :name => "index_spud_photo_albums_photos_on_spud_photo_album_id"

  create_table "spud_photo_galleries", :force => true do |t|
    t.string   "title"
    t.string   "url_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "spud_photo_galleries", ["url_name"], :name => "index_spud_photo_galleries_on_url_name"

  create_table "spud_photo_galleries_albums", :force => true do |t|
    t.integer "spud_photo_gallery_id"
    t.integer "spud_photo_album_id"
    t.integer "order",                 :default => 0
  end

  add_index "spud_photo_galleries_albums", ["spud_photo_gallery_id"], :name => "index_spud_photo_galleries_albums_on_spud_photo_gallery_id"

  create_table "spud_photos", :force => true do |t|
    t.string   "title"
    t.string   "caption"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "spud_user_settings", :force => true do |t|
    t.integer  "spud_user_id"
    t.string   "key"
    t.string   "value"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "spud_users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "super_admin"
    t.string   "login",                              :null => false
    t.string   "email",                              :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "time_zone"
  end

  add_index "spud_users", ["email"], :name => "index_spud_users_on_email"
  add_index "spud_users", ["login"], :name => "index_spud_users_on_login"

end
