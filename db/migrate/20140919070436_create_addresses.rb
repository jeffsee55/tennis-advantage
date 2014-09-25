class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :township
      t.string :city
      t.string :country
      t.string :zip

      t.timestamps
    end
  end
end
