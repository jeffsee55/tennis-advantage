class AddPageAttributeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :page, :string
  end
end
