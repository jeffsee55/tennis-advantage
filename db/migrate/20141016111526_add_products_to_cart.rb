class AddProductsToCart < ActiveRecord::Migration
  def change
    add_column :carts, :products, :text
  end
end
