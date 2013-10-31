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

ActiveRecord::Schema.define(:version => 20131031122342) do

  create_table "attendances", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "contest_id", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contests", :force => true do |t|
    t.string   "name"
    t.text     "introduction"
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "outputs", :force => true do |t|
    t.text "input_type"
    t.text "output"
  end

  create_table "problems", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "description_html"
    t.text     "small_input"
    t.text     "small_output"
    t.text     "large_input"
    t.text     "large_output"
    t.integer  "small_score",      :default => 0,     :null => false
    t.integer  "large_score",      :default => 0,     :null => false
    t.boolean  "is_solved",        :default => false, :null => false
    t.integer  "contest_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  create_table "submissions", :force => true do |t|
    t.string   "problem_type"
    t.boolean  "solved",        :default => false, :null => false
    t.integer  "score",         :default => 0,     :null => false
    t.integer  "problem_id"
    t.integer  "attendance_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "is_admin",           :default => false, :null => false
    t.integer  "group_id"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

end
