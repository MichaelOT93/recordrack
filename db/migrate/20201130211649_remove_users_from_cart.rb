class RemoveUsersFromCart < ActiveRecord::Migration[6.0]
  def change
    remove_reference :carts, :user, null: false, foreign_key: true
  end
end
