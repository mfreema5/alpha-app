class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :short_title
      t.text :biblio_info
      t.string :url
      t.integer :course_id

      t.timestamps null: false
    end
  end
end
