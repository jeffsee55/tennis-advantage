class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.text :subject
      t.text :message
      t.string :email
      t.string :name
      t.string :phone

      t.timestamps
    end
  end
end
