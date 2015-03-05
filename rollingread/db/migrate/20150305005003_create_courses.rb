class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_number
      t.string :short_title
      t.text :description
      t.integer :meet_days
      t.belongs_to :semester, index: true

      t.timestamps null: false
    end
    add_foreign_key :courses, :semesters
  end
end
