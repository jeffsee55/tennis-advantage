class AddShippedToCharges < ActiveRecord::Migration
  def change
    add_column :charges, :shipped, :boolean
  end
end
