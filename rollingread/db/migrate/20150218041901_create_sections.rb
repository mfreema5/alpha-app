class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :chapter_number
      t.text :details
      t.string :read_by
      t.boolean :completed
      t.integer :source_id

      t.timestamps null: false
    end
  end
end
