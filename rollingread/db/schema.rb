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

ActiveRecord::Schema.define(version: 20150305005119) do

  create_table "assignments", force: :cascade do |t|
    t.string   "short_title"
    t.text     "details"
    t.string   "url"
    t.date     "due_date"
    t.boolean  "completed"
    t.integer  "source_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "assignments", ["source_id"], name: "index_assignments_on_source_id"

  create_table "courses", force: :cascade do |t|
    t.string   "course_number"
    t.string   "short_title"
    t.text     "description"
    t.integer  "meet_days"
    t.integer  "semester_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "courses", ["semester_id"], name: "index_courses_on_semester_id"

  create_table "sections", force: :cascade do |t|
    t.integer  "chapter_number"
    t.text     "details"
    t.string   "read_by"
    t.boolean  "completed"
    t.integer  "source_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "semesters", force: :cascade do |t|
    t.string   "short_title"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sources", force: :cascade do |t|
    t.string   "short_title"
    t.text     "description"
    t.boolean  "dummy"
    t.integer  "course_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "sources", ["course_id"], name: "index_sources_on_course_id"

end
