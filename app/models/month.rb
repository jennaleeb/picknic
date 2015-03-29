class Month < ActiveRecord::Base
	has_many :ingredients, through: :ingredient_availabilities
end
