class AddFieldsToCharges < ActiveRecord::Migration
  def change
    add_column :charges, :email, :string
    add_column :charges, :first_name, :string
    add_column :charges, :last_name, :string
    add_column :charges, :amount, :integer
    add_column :charges, :address_id, :integer
  end
end
