class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :name
      t.integer :rank
      t.integer :points
      t.text :title
      t.text :notes

      t.timestamps null: false
    end
  end
end
