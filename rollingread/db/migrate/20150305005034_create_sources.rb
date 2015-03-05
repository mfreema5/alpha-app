class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :short_title
      t.text :description
      t.boolean :dummy
      t.belongs_to :course, index: true

      t.timestamps null: false
    end
    add_foreign_key :sources, :courses
  end
end
