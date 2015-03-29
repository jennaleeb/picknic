class Month < ActiveRecord::Base
	# An month (or season) has many available ingredients
	has_many :ingredient_availabilities
	has_many :ingredients, through: :ingredient_availabilities

	#Validates only one instance for every month
	validates :name, uniqueness: true

end
