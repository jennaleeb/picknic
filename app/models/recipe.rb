class Recipe < ActiveRecord::Base
	PREP_TIMES = [['< 15 minutes',15], ['< 30 minutes',30], ['< 1 hour', 60], ['< 2 hours',120], ['> 2 hours',121]]

	MEAL_TYPES = ["Appetizer", "Entree", "Side", "Dessert"]

	# def filter_by_prep_time(prep_time)
	# 	case 
	# 	when prep_time <= 15
	# 	  @recipes = Recipe.where(prep_time: 15)
	# 	when prep_time <= 30
	# 	  @recipes = Recipe.where(prep_time: (15)..(30))
	# 	when prep_time <= 60
	# 	  @recipes = Recipe.where(prep_time: (15)..(60))
	# 	when prep_time <= 120
	# 	  @recipes = Recipe.where(prep_time: (15)..(120))
	# 	when prep_time > 120
	# 	  @recipes = Recipe.all
	# 	else
	# 	  @recipes = Recipe.all
	# 	end

	# end
end
