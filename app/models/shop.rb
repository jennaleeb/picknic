class Shop < ActiveRecord::Base
	# Shop information
	has_one :address, dependent: :destroy
	has_one :web_info, dependent: :destroy
	has_many :operating_hours

	accepts_nested_attributes_for :address, :web_info

	# Connect to ingredients (TODO)
	has_many :shop_ingredients
	has_many :ingredients, through: :shop_ingredients

	# Connect to user favourite shops
	has_many :user_favourite_shops
	has_many :users, through: :user_favourite_shops

end
