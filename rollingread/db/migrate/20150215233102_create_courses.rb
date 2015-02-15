class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_number
      t.string :short_title
      t.text :description
      t.string :meet_time
      t.string :meet_day

      t.timestamps null: false
    end
  end
end
