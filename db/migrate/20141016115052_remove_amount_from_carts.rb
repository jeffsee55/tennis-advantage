class RemoveAmountFromCarts < ActiveRecord::Migration
  def change
    remove_column :carts, :amount
  end
end
