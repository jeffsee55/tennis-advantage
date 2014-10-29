class AddChargeIdToCartItems < ActiveRecord::Migration
  def change
    add_column :cart_items, :charge_id, :integer
  end
end
