class AddPurchasedToCartItems < ActiveRecord::Migration
  def change
    add_column :cart_items, :purchased, :boolean
  end
end
