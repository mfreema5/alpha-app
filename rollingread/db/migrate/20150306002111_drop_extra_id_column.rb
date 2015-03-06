class DropExtraIdColumn < ActiveRecord::Migration
  def change
    remove_column :courses, :semester_id
    remove_column :sources, :course_id
    remove_column :assignments, :source_id
  end
end
