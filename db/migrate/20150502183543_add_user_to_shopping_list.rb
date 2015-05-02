class AddUserToShoppingList < ActiveRecord::Migration
  def change
    add_reference :shopping_lists, :user, index: true
    add_foreign_key :shopping_lists, :users
  end
end
