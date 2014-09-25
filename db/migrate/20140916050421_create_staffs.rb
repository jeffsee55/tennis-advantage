class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
