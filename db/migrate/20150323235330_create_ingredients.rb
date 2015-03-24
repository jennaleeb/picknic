class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.decimal :quantity
      t.string :quantity_unit

      t.timestamps null: false
    end
  end
end
