class ChangeCartData < ActiveRecord::Migration
  def change
    remove_column :carts, :products
    add_column    :carts, :cart_item_id, :integer
  end
end
