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

ActiveRecord::Schema.define(:version => 20140114031300) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "owner_id"
    t.string   "owner_type"
  end

  create_table "admins", :force => true do |t|
    t.string   "login"
    t.string   "password_digest"
    t.string   "role"
    t.string   "name"
    t.string   "status"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "invites", :force => true do |t|
    t.string   "invite_type"
    t.integer  "user_id"
    t.integer  "team_id"
    t.string   "status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "message_expands", :force => true do |t|
    t.integer  "from"
    t.integer  "to"
    t.string   "status"
    t.integer  "message_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "messages", :force => true do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "pid"
    t.string   "message_type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "players", :force => true do |t|
    t.string   "name"
    t.integer  "height"
    t.string   "position"
    t.string   "pic"
    t.integer  "number"
    t.string   "alias"
    t.float    "weight"
    t.string   "ball_age"
    t.string   "description"
    t.integer  "team_id"
    t.integer  "user_id"
    t.string   "status"
    t.string   "birthday"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "notice"
    t.string   "power"
    t.string   "declarater"
    t.string   "region"
    t.string   "area"
    t.string   "level"
    t.string   "status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "user_team_rels", :force => true do |t|
    t.integer  "user_id"
    t.string   "part"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "address"
    t.string   "name"
    t.string   "nickname"
    t.string   "tel"
    t.string   "qq"
    t.string   "status"
    t.string   "token"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "email"
    t.integer  "team_id"
  end

end
