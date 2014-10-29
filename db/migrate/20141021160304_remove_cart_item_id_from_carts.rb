class RemoveCartItemIdFromCarts < ActiveRecord::Migration
  def change
    remove_column :carts, :cart_item_id
  end
end
