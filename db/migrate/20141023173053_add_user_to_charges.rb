class AddUserToCharges < ActiveRecord::Migration
  def change
    remove_column :charges, :first_name
    remove_column :charges, :last_name
    remove_column :charges, :email
    remove_column :charges, :amount

    add_column    :charges, :user_id, :integer
  end
end
