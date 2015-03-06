class DropExtraIdColumn < ActiveRecord::Migration
  def change
    remove_column :courses, :semester_id, :integer
    remove_column :sources, :course_id, :integer
    remove_column :assignments, :source_id, :integer
  end
end
