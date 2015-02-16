class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_number
      t.string :short_title
      t.text :description
      t.integer :meet_day1
      t.integer :meet_day2
      t.integer :meet_day3
      t.integer :meet_day4
      t.integer :meet_day5
      t.integer :meet_day6
      t.integer :meet_day7
      t.integer :semester_id

      t.timestamps null: false
    end
  end
end
