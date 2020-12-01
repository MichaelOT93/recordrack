class AddRecordsToLineItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :line_items, :record, null: false, foreign_key: true
  end
end
