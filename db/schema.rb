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

ActiveRecord::Schema.define(:version => 20130701205419) do

  create_table "activities", :force => true do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "activities", ["owner_id", "owner_type"], :name => "index_activities_on_owner_id_and_owner_type"
  add_index "activities", ["recipient_id", "recipient_type"], :name => "index_activities_on_recipient_id_and_recipient_type"
  add_index "activities", ["trackable_id", "trackable_type"], :name => "index_activities_on_trackable_id_and_trackable_type"

  create_table "addresses", :force => true do |t|
    t.string   "label"
    t.string   "street"
    t.string   "locality"
    t.string   "region"
    t.string   "postcode"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "admin_notifications", :force => true do |t|
    t.boolean  "read"
    t.integer  "admin_id"
    t.integer  "activity_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "password_salt"
    t.string   "name"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admins", ["authentication_token"], :name => "index_admins_on_authentication_token", :unique => true
  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true
  add_index "admins", ["unlock_token"], :name => "index_admins_on_unlock_token", :unique => true

  create_table "affiliates", :force => true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "country"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "website"
    t.text     "description"
    t.string   "status"
    t.integer  "old_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "allies", :force => true do |t|
    t.string   "email",                  :default => "",           :null => false
    t.string   "encrypted_password",     :default => "",           :null => false
    t.string   "password_salt"
    t.string   "name",                   :default => ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "join_date"
    t.date     "dob"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "account_type",           :default => "Individual"
    t.string   "website"
    t.string   "phone"
    t.text     "bio"
    t.string   "status",                 :default => "active"
    t.boolean  "subscribed",             :default => false
    t.integer  "old_id"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "allies", ["authentication_token"], :name => "index_allies_on_authentication_token", :unique => true
  add_index "allies", ["confirmation_token"], :name => "index_allies_on_confirmation_token", :unique => true
  add_index "allies", ["email"], :name => "index_allies_on_email", :unique => true
  add_index "allies", ["reset_password_token"], :name => "index_allies_on_reset_password_token", :unique => true
  add_index "allies", ["unlock_token"], :name => "index_allies_on_unlock_token", :unique => true

  create_table "bills", :force => true do |t|
    t.string   "official_title"
    t.text     "summary_short"
    t.datetime "last_vote_at"
    t.string   "last_action"
    t.text     "nicknames"
    t.text     "urls"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.text     "votes"
    t.text     "vote_list"
  end

  create_table "campaigns", :force => true do |t|
    t.integer  "goal"
    t.date     "end_date"
    t.date     "completed_date"
    t.text     "description"
    t.string   "code"
    t.string   "status"
    t.integer  "ally_id"
    t.integer  "need_id"
    t.integer  "campaign_id",    :default => 0
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "label"
    t.string   "code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "donations", :force => true do |t|
    t.integer  "amount"
    t.datetime "date"
    t.string   "email"
    t.string   "phone"
    t.string   "transaction_type"
    t.text     "notes"
    t.string   "code"
    t.integer  "ally_id"
    t.integer  "need_id"
    t.integer  "affiliate_id"
    t.integer  "category_id"
    t.integer  "campaign_id"
    t.integer  "payment_id"
    t.integer  "old_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

# Could not dump table "items" because of following StandardError
#   Unknown type 'hstore' for column 'options'

  create_table "needs", :force => true do |t|
    t.string   "title"
    t.string   "city"
    t.string   "country"
    t.string   "latitude"
    t.string   "longitude"
    t.text     "description"
    t.date     "start_date",                          :null => false
    t.date     "end_date"
    t.date     "wired_date"
    t.date     "completed_date"
    t.date     "funded_date"
    t.integer  "price"
    t.integer  "items_needed"
    t.integer  "impressions"
    t.text     "notes"
    t.string   "code"
    t.boolean  "urgent",           :default => false
    t.integer  "affiliate_id"
    t.integer  "category_id"
    t.integer  "old_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.date     "pending_date"
    t.date     "feedback_date"
    t.date     "closed_date"
    t.date     "incompleted_date"
  end

  create_table "orders", :force => true do |t|
    t.string   "label"
    t.string   "status"
    t.integer  "total",        :default => 0
    t.string   "code"
    t.datetime "purchased_at"
    t.integer  "ally_id"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "payments", :force => true do |t|
    t.string   "response_code"
    t.string   "authorization_code"
    t.string   "transaction_id"
    t.integer  "amount"
    t.string   "method"
    t.string   "card_type"
    t.integer  "order_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "photographs", :force => true do |t|
    t.boolean  "primary",             :default => false
    t.string   "title"
    t.string   "caption"
    t.integer  "photographable_id"
    t.string   "photographable_type"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

# Could not dump table "products" because of following StandardError
#   Unknown type 'hstore' for column 'options'

  create_table "reports_dailies", :force => true do |t|
    t.date     "date"
    t.integer  "date_id",                          :null => false
    t.integer  "donations_total",   :default => 0
    t.integer  "donations_count",   :default => 0
    t.integer  "wirings_total",     :default => 0
    t.integer  "wirings_count",     :default => 0
    t.integer  "needs_impressions", :default => 0
    t.integer  "needs_created",     :default => 0
    t.integer  "needs_completed",   :default => 0
    t.integer  "needs_funded",      :default => 0
    t.integer  "allies_signups",    :default => 0
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "reports_dailies_categories", :force => true do |t|
    t.date     "date"
    t.integer  "date_id",                          :null => false
    t.integer  "category_id",                      :null => false
    t.integer  "donations_total",   :default => 0
    t.integer  "donations_count",   :default => 0
    t.integer  "wirings_total",     :default => 0
    t.integer  "wirings_count",     :default => 0
    t.integer  "needs_impressions", :default => 0
    t.integer  "needs_created",     :default => 0
    t.integer  "needs_completed",   :default => 0
    t.integer  "needs_funded",      :default => 0
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "reports_monthlies", :force => true do |t|
    t.string   "month"
    t.string   "year"
    t.integer  "donations_total",   :default => 0
    t.integer  "donations_count",   :default => 0
    t.integer  "wirings_total",     :default => 0
    t.integer  "wirings_count",     :default => 0
    t.integer  "needs_impressions", :default => 0
    t.integer  "needs_created",     :default => 0
    t.integer  "needs_completed",   :default => 0
    t.integer  "needs_funded",      :default => 0
    t.integer  "allies_signups",    :default => 0
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "reports_monthlies_categories", :force => true do |t|
    t.string   "month"
    t.string   "year"
    t.integer  "category_id",                      :null => false
    t.integer  "donations_total",   :default => 0
    t.integer  "donations_count",   :default => 0
    t.integer  "wirings_total",     :default => 0
    t.integer  "wirings_count",     :default => 0
    t.integer  "needs_impressions", :default => 0
    t.integer  "needs_created",     :default => 0
    t.integer  "needs_completed",   :default => 0
    t.integer  "needs_funded",      :default => 0
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "reports_yearlies", :force => true do |t|
    t.string   "year"
    t.integer  "donations_total",   :default => 0
    t.integer  "donations_count",   :default => 0
    t.integer  "wirings_total",     :default => 0
    t.integer  "wirings_count",     :default => 0
    t.integer  "needs_impressions", :default => 0
    t.integer  "needs_created",     :default => 0
    t.integer  "needs_completed",   :default => 0
    t.integer  "needs_funded",      :default => 0
    t.integer  "allies_signups",    :default => 0
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "reports_yearlies_categories", :force => true do |t|
    t.string   "year"
    t.integer  "category_id",                      :null => false
    t.integer  "donations_total",   :default => 0
    t.integer  "donations_count",   :default => 0
    t.integer  "wirings_total",     :default => 0
    t.integer  "wirings_count",     :default => 0
    t.integer  "needs_impressions", :default => 0
    t.integer  "needs_created",     :default => 0
    t.integer  "needs_completed",   :default => 0
    t.integer  "needs_funded",      :default => 0
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "songs", :force => true do |t|
    t.string   "artist"
    t.string   "album"
    t.string   "title"
    t.text     "description"
    t.integer  "ally_id"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "users", :force => true do |t|
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
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "videos", :force => true do |t|
    t.string   "service"
    t.string   "resource_id"
    t.integer  "watchable_id"
    t.string   "watchable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "votes", :force => true do |t|
    t.string   "roll_id"
    t.string   "vote_type"
    t.string   "question"
    t.string   "required"
    t.text     "voter_ids"
    t.string   "result"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "bill_id"
  end

  create_table "wirings", :force => true do |t|
    t.integer  "amount"
    t.date     "date"
    t.integer  "need_id"
    t.integer  "old_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
