class Diet < ActiveRecord::Base
	# A diet consists of many ingredient types
	has_many :diet_ingredient_types
	has_many :ingredient_types, through: :diet_ingredient_types

	# A diet can be followed by many users (via the users' dietary preferences)
	has_many :dietary_preferences
	has_many :users, through: :dietary_preferences

	# A diet must have a name
	validates :name, :presence => { message: "Please enter a name for the diet."},
		:uniqueness => { message: "A diet already exists with the name you've entered.  Please re-enter a new name for the diet."}
end
