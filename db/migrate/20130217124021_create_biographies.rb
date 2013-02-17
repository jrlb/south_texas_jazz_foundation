class CreateBiographies < ActiveRecord::Migration
  def change
    create_table :biographies do |t|
      t.integer :member_id
      t.string :first_name
      t.string :last_name
      t.string :instrument
      t.text :biography

      t.timestamps
    end
  end
end
