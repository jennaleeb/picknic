class ShoppingListItem < ActiveRecord::Base
  belongs_to :shopping_list
  has_one :recipe_ingredient_quantity

  # Mark a shopping list item as "done"
  def mark_done
  	this.done = true
  end
end
