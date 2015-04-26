class Shop < ActiveRecord::Base
	# Shop information
	has_one :address, dependent: :destroy
	has_one :contact_info, dependent: :destroy
	has_one :web_info, dependent: :destroy
	has_many :operating_hours

	accepts_nested_attributes_for :address, :contact_info, :web_info

	# Connect to ingredients (TODO)
	has_many :shop_ingredients
	has_many :ingredients, through: :shop_ingredients

	# Connect to user favourite shops
	has_many :user_favourite_shops, dependent: :destroy
	has_many :users, through: :user_favourite_shops

	# Validation rules
	validates :name, :presence => { message: "You've entered a blank name for the shop. Please re-enter the shop name."}

	# Flexible search for shops by shop name, city and province
	def self.shops_filter(name, city, province)

		# Filter shops by name
		shops_list = name.present? ? Shop.where(name: name) : Shop.all

		# Filter shops by city
		shops_list = city.present? ?
			shops_list.joins(:address).where( addresses: { city: city } ) :
			shops_list

		# Filter shops by province
		shops_list = province.present? ?
			shops_list.joins(:address).where( addresses: { province: province } ) :
			shops_list

		shops_list

	end

end
