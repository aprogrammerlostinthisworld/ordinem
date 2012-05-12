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

ActiveRecord::Schema.define(:version => 20120510121133) do

  create_table "collaborations", :force => true do |t|
    t.integer  "project_id"
    t.integer  "member_id"
    t.boolean  "can_manage_tasks", :default => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  create_table "pages", :force => true do |t|
    t.string  "name"
    t.string  "title"
    t.text    "content"
    t.string  "locale",    :limit => 5, :default => "en",  :null => false
    t.boolean "published",              :default => false, :null => false
  end

  create_table "projects", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.text     "goal"
    t.integer  "state",                  :default => 0
    t.boolean  "public",                 :default => false
    t.date     "date_from"
    t.date     "date_to"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "tasks_counter",          :default => 0,     :null => false
    t.integer  "tasks_complete_counter", :default => 0,     :null => false
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "tasks", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.integer  "priority"
    t.integer  "status",          :default => 0
    t.datetime "date_start"
    t.datetime "date_due"
    t.integer  "updated_by_id"
    t.datetime "completed_at"
    t.integer  "completed_by_id"
    t.integer  "tasktable_id",                   :null => false
    t.string   "tasktable_type",                 :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "tasks", ["tasktable_id", "tasktable_type"], :name => "index_tasks_on_tasktable_id_and_tasktable_type"

  create_table "users", :force => true do |t|
    t.string   "first_name",             :limit => 20
    t.string   "last_name",              :limit => 30
    t.string   "home_address"
    t.string   "home_number",            :limit => 20
    t.string   "office_number",          :limit => 20
    t.string   "fax_number",             :limit => 20
    t.string   "mobile_number",          :limit => 20, :default => "+",   :null => false
    t.string   "time_zone",                            :default => "",    :null => false
    t.string   "locale",                 :limit => 5,  :default => "en",  :null => false
    t.boolean  "admin",                                :default => false, :null => false
    t.string   "email",                                :default => "",    :null => false
    t.string   "encrypted_password",                   :default => ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",                      :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
    t.string   "invitation_token",       :limit => 60
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["invitation_token"], :name => "index_users_on_invitation_token"
  add_index "users", ["invited_by_id"], :name => "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
