class CreatePressReleases < ActiveRecord::Migration
  def change
    create_table :press_releases do |t|
      t.string :title
      t.text :story

      t.timestamps
    end
  end
end
