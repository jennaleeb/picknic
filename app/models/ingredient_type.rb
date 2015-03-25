class IngredientType < ActiveRecord::Base
	# An ingredient type encompasses many ingredients
	has_many :ingredients

	# An ingredient type must have a name
	validates :name, { presence: true }

end
