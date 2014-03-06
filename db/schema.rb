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

ActiveRecord::Schema.define(version: 20140306214720) do

  create_table "courses", force: true do |t|
    t.string   "name"
    t.string   "term"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "current_week"
    t.text     "weeks"
    t.string   "link"
    t.string   "title"
  end

  create_table "students", force: true do |t|
    t.string   "student_number"
    t.string   "last_name"
    t.string   "first_name"
    t.integer  "total"
    t.string   "weeks"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "github"
    t.integer  "student_id"
  end

  create_table "week_statistics", force: true do |t|
    t.integer  "week"
    t.integer  "course_id"
    t.integer  "submissions"
    t.integer  "completed_exercises"
    t.integer  "used_time"
    t.text     "exercises"
    t.text     "times"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
