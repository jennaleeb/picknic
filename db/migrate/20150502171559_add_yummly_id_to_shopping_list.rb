class AddYummlyIdToShoppingList < ActiveRecord::Migration
  def change
  	add_column :shopping_lists, :yummly_id, :string
  end
end
