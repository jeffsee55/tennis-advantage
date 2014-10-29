class ChangeColumnsForAddresses < ActiveRecord::Migration
  def change
    remove_column :addresses, :street
    add_column    :addresses, :address_line_1, :string
    add_column    :addresses, :address_line_2, :string
  end
end
