class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.string :title
      t.string :artist
      t.string :genre
      t.text :description
      t.date :year
      t.decimal :price

      t.timestamps
    end
  end
end
