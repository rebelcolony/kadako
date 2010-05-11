# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100406105844) do

  create_table "bodies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "histories", :force => true do |t|
    t.date     "start"
    t.date     "end"
    t.text     "description"
    t.text     "equipment"
    t.string   "company"
    t.string   "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "sector_id"
  end

  create_table "levels", :force => true do |t|
    t.string   "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "original_article"
  end

  create_table "qualifications", :force => true do |t|
    t.date     "expire_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "body_id"
    t.integer  "category_id"
    t.integer  "technique_id"
    t.integer  "level_id"
    t.integer  "user_id"
    t.string   "cert_file_name"
    t.string   "cert_content_type"
    t.integer  "cert_file_size"
    t.datetime "cert_update_at"
  end

  create_table "sectors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "techniques", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_sessions", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :null => false
    t.string   "crypted_password",                      :null => false
    t.string   "password_salt",                         :null => false
    t.string   "persistence_token",                     :null => false
    t.integer  "login_count"
    t.integer  "failed_login_count"
    t.datetime "last_login_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.date     "dob"
    t.text     "address"
    t.string   "passport_number"
    t.date     "passport_expires"
    t.string   "nationality"
    t.string   "contact_email"
    t.string   "home_phone"
    t.string   "mobile_phone"
    t.string   "headshot_file_name"
    t.string   "headshot_content_type"
    t.integer  "headshot_file_size"
    t.datetime "headshot_updated_at"
    t.string   "pcn_number"
    t.string   "other_body_id"
    t.string   "perishable_token",      :default => "", :null => false
  end

  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"

end
