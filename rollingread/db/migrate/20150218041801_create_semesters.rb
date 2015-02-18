class CreateSemesters < ActiveRecord::Migration
  def change
    create_table :semesters do |t|
      t.string :short_title
      t.text :description
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
