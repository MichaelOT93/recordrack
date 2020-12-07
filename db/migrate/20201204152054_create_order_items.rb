class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.string :title
      t.string :artist
      t.string :genre
      t.text :description
      t.date :year
      t.decimal :price
      t.string :album_cover
      t.integer :quantity
      t.references :line_items, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
