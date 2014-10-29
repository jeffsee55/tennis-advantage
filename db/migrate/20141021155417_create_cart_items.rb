class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.string :user_id
      t.string :product_id

      t.timestamps
    end
  end
end
