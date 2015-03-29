class Recipe < ActiveRecord::Base
	# A recipe has many ingredients, which is managed through a tracking table of ingredient quanities-per-recipe 
	has_many :recipe_ingredient_quantities
	has_many :ingredients, through: :recipe_ingredient_quantities

	PREP_TIMES = [['< 15 minutes',15], ['< 30 minutes',30], ['< 1 hour', 60], ['< 2 hours',120], ['> 2 hours',121]]

	MEAL_TYPES = ["Appetizer", "Entree", "Side", "Dessert"]

	def self.meal_filter(prep_time, meal_type)
		case 
		when prep_time <= 15
		  Recipe.where(prep_time: (0)..(15), meal_type: meal_type)
		when prep_time <= 30
		  Recipe.where(prep_time: (0)..(30), meal_type: meal_type)
		when prep_time <= 60
		  Recipe.where(prep_time: (0)..(60), meal_type: meal_type)
		when prep_time <= 120
		  Recipe.where(prep_time: (0)..(120), meal_type: meal_type)
		when prep_time > 120
		  Recipe.where(prep_time: (0)..(300), meal_type: meal_type)
		else
		  Recipe.all
		end

	end

	# Filter recipes by ingredient type (core functionality!!!!)
	#
	# Seafood - Find all recipes that contain seafood ingredients
	# Meat - Find all recipes that contain meat ingredients
	# Nuts - Find all recipes that contains nuts
	# Vegan - Find all recipes that does not contain seafood, meat, dairy or eggs
	# Vegetarian - Find all recipes that does not contain seafood and meat
	#
	# Initial implementation: 
	# 1) Use a complex multi-way join
	# 2) Manually munge up an array based on the value of an ingredient type search 
	# (this is what I have implemented: ask instructors if there's a better way to do this!)
	#
	def self.ingredient_type_filter(ingredient_type)
		result = []

		Recipe.all.each do |recipe|
			case
			when ingredient_type == 'Vegan'
				if !(recipe.ingredients.meat_and_seafood_ingredients.present? || recipe.ingredients.dairy_ingredients.present?) && recipe.ingredients.vegan_ingredients.present? then
					result.push recipe
				end
			when ingredient_type == 'Vegetarian'
				if !recipe.ingredients.meat_and_seafood_ingredients.present? then
					result.push recipe 
				end
			when ingredient_type == 'Dairy'
				if recipe.ingredients.dairy_ingredients.present? then
					result.push recipe 
				end
			when ingredient_type == 'Seafood'
				if recipe.ingredients.seafood_ingredients.present? then
					result.push recipe 
				end
			when ingredient_type == 'Meat'
				if recipe.ingredients.meat_ingredients.present? then
					result.push recipe 
				end
			when ingredient_type == 'Meat and Seafood'
				if recipe.ingredients.meat_and_seafood_ingredients.present? then
					result.push recipe 
				end
			when ingredient_type == 'Nuts'
				if recipe.ingredients.nut_ingredients.present? then
					result.push recipe 
				end
			else
				result.push recipe
			end

		end

		result
	end

end
