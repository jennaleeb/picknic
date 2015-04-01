class ShoppingListItem < ActiveRecord::Base
  belongs_to :shopping_list

  # Mark a shopping list item as "done"
  def mark_done
  	self.done = true
  end
end
