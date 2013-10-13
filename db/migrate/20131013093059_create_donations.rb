class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :amount
      t.string :name
      t.string :email

      t.timestamps
    end
    add_index :donations, :email
  end
end
