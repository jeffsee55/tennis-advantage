class MakePurchasedBoolenDefault < ActiveRecord::Migration
  def up
    change_column :cart_items, :purchased, :boolean, default: false
  end

  def down
    change_column :cart_items, :purchased, :boolean, default: nil
  end
end
