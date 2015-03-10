class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :short_assignment
      t.text :assignment_details
      t.string :url
      t.date :due_date
      t.boolean :completed
      t.belongs_to :source, index: true

      t.timestamps null: false
    end
    add_foreign_key :assignments, :sources
  end
end
