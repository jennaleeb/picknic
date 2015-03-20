class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :instructions
      t.integer :prep_time
      t.string :meal_type

      t.timestamps null: false
    end
  end
end
