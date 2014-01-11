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

ActiveRecord::Schema.define(version: 20140111131805) do

  create_table "courses", force: true do |t|
    t.string   "name"
    t.string   "term"
    t.integer  "week1"
    t.integer  "week2"
    t.integer  "week3"
    t.integer  "week4"
    t.integer  "week5"
    t.integer  "week6"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "current_week"
  end

  create_table "submissions", force: true do |t|
    t.string   "student_number"
    t.string   "last_name"
    t.string   "first_name"
    t.integer  "week"
    t.integer  "points"
    t.string   "identifier"
    t.integer  "hours"
    t.text     "comments"
    t.string   "email"
    t.boolean  "a1"
    t.boolean  "a2"
    t.boolean  "a3"
    t.boolean  "a4"
    t.boolean  "a5"
    t.boolean  "a6"
    t.boolean  "a7"
    t.boolean  "a8"
    t.boolean  "a9"
    t.boolean  "a10"
    t.boolean  "a11"
    t.boolean  "a12"
    t.boolean  "a13"
    t.boolean  "a14"
    t.boolean  "a15"
    t.boolean  "a16"
    t.boolean  "a17"
    t.boolean  "a18"
    t.boolean  "a19"
    t.boolean  "a20"
    t.boolean  "a21"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
  end

end
