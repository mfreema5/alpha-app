# Fixing Tables

Long story short, I thought that things like `semester_id` were cruft left over from earlier work on the app.  Indeed, there was cruft left over, which is why I ended up wiping out the tables and `db/schema.rb` entirely

### Details

What I did to get the tables right, commands and outputs:

```bash
 $ rake db:migrate VERSION=0

== 20150306002111 DropExtraIdColumn: reverting ================================
-- add_column(:assignments, :source_id, :integer)
   -> 0.0013s
-- add_column(:sources, :course_id, :integer)
   -> 0.0004s
-- add_column(:courses, :semester_id, :integer)
   -> 0.0005s
== 20150306002111 DropExtraIdColumn: reverted (0.0055s) =======================

== 20150305005119 CreateAssignments: reverting ================================
-- remove_foreign_key(:assignments, :sources)
   -> 0.0000s
-- drop_table(:assignments)
   -> 0.0012s
== 20150305005119 CreateAssignments: reverted (0.0015s) =======================

== 20150305005034 CreateSources: reverting ====================================
-- remove_foreign_key(:sources, :courses)
   -> 0.0000s
-- drop_table(:sources)
   -> 0.0005s
== 20150305005034 CreateSources: reverted (0.0008s) ===========================

== 20150305005003 CreateCourses: reverting ====================================
-- remove_foreign_key(:courses, :semesters)
   -> 0.0000s
-- drop_table(:courses)
   -> 0.0008s
== 20150305005003 CreateCourses: reverted (0.0010s) ===========================

== 20150305004924 CreateSemesters: reverting ==================================
-- drop_table(:semesters)
   -> 0.0007s
== 20150305004924 CreateSemesters: reverted (0.0008s) =========================

$ rm db/migrate/20150306002111_drop_extra_id_column.rb

$ rm db/schema.rb

$ rake db:drop

$ rake db:migrate
== 20150305004924 CreateSemesters: migrating ==================================
-- create_table(:semesters)
   -> 0.0013s
== 20150305004924 CreateSemesters: migrated (0.0014s) =========================

== 20150305005003 CreateCourses: migrating ====================================
-- create_table(:courses)
   -> 0.0011s
-- add_foreign_key(:courses, :semesters)
   -> 0.0000s
== 20150305005003 CreateCourses: migrated (0.0012s) ===========================

== 20150305005034 CreateSources: migrating ====================================
-- create_table(:sources)
   -> 0.0011s
-- add_foreign_key(:sources, :courses)
   -> 0.0000s
== 20150305005034 CreateSources: migrated (0.0013s) ===========================

== 20150305005119 CreateAssignments: migrating ================================
-- create_table(:assignments)
   -> 0.0011s
-- add_foreign_key(:assignments, :sources)
   -> 0.0000s
== 20150305005119 CreateAssignments: migrated (0.0013s) =======================

$ cat db/schema.rb 
# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
[…]

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
```



