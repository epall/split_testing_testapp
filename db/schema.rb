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

ActiveRecord::Schema.define(:version => 20080804204917) do

  create_table "feature_testers", :force => true do |t|
    t.integer "feature_id"
    t.integer "tester_id"
    t.boolean "enabled"
  end

  create_table "features", :force => true do |t|
    t.string  "name"
    t.boolean "enabled"
    t.boolean "restricted"
  end

  create_table "features_roles", :force => true do |t|
    t.integer "feature_id"
    t.integer "role_id"
  end

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "roles_testers", :force => true do |t|
    t.integer "role_id"
    t.integer "tester_id"
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
