class RemovePagesColumn < ActiveRecord::Migration
  def change
    remove_column :posts, :page
  end
end
