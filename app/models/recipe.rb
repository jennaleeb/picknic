class Recipe < ActiveRecord::Base
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

end
