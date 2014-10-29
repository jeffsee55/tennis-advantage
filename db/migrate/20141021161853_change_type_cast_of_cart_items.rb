class ChangeTypeCastOfCartItems < ActiveRecord::Migration
  def change
    remove_column :cart_items, :user_id
    remove_column :cart_items, :product_id

    add_column    :cart_items, :user_id, :integer
    add_column    :cart_items, :product_id, :integer
  end
end
