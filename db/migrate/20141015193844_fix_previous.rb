class FixPrevious < ActiveRecord::Migration
  def change
    remove_column :users, :page
    add_column    :posts, :page, :string
  end
end
