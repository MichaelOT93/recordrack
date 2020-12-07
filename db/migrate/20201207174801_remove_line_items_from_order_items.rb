class RemoveLineItemsFromOrderItems < ActiveRecord::Migration[6.0]
  def change
    remove_reference :order_items, :line_items, null: false, foreign_key: true
  end
end
