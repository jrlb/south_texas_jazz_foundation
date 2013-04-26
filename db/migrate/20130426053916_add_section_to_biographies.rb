class AddSectionToBiographies < ActiveRecord::Migration
  def change
    add_column :biographies, :section, :string
  end
end
