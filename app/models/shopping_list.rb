class ShoppingList < ActiveRecord::Base
	has_many :shopping_list_items, dependent: :destroy

	belongs_to :user

    # Ensure that Yummly ID is always recorded
    validates :yummly_id, { presence: true }

	# Ensure you can't add the same recipe's shopping list twice
    validates_uniqueness_of :yummly_id

    # Check if recipe with given Yummly ID already has shopping list
    def self.has_shopping_list_for_recipe?(user_id, yummly_id)
    	return self.find_by(user_id: user_id, yummly_id: yummly_id)
  	end
end
