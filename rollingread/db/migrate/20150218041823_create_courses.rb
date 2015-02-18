class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_number
      t.string :short_title
      t.text :description
      t.boolean :meet_day1
      t.boolean :meet_day2
      t.boolean :meet_day3
      t.boolean :meet_day4
      t.boolean :meet_day5
      t.boolean :meet_day6
      t.boolean :meet_day7
      t.integer :semester_id

      t.timestamps null: false
    end
  end
end
