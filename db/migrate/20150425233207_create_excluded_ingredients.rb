class CreateExcludedIngredients < ActiveRecord::Migration
  def change
    create_table :excluded_ingredients do |t|
      t.string :name
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :excluded_ingredients, :users
  end
end
