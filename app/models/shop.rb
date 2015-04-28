class Shop < ActiveRecord::Base
	# Shop information
	has_one :address, dependent: :destroy
	has_one :contact_info, dependent: :destroy
	has_one :web_info, dependent: :destroy
	has_many :operating_hours

	# Connect to ingredients (TODO)
	has_many :shop_ingredients, dependent: :destroy
	has_many :ingredients, through: :shop_ingredients

	accepts_nested_attributes_for :address, :contact_info, :web_info, :shop_ingredients

	# Connect to user favourite shops
	has_many :user_favourite_shops, dependent: :destroy
	has_many :users, through: :user_favourite_shops

	# Validation rules
	validates :name, :presence => { message: "You've entered a blank name for the shop. Please re-enter the shop name."}

	# Geocoding
	geocoded_by :get_full_address   # can also be an IP address
	after_validation :geocode          # auto-fetch coordinates

	# Flexible search for shops by shop name, distance from current
	# user location, city and province
	def self.shops_filter(name, city, province, nearest_distance, user_lat_long)

		# Filter shops by name
		shops_list = name.present? ? Shop.where(name: name) : Shop.all

		# Filter shops by nearest specified kilometres from the user's
		# current location (expressed as latitude-longitude coordinates)
		shops_list = nearest_distance.present? ?
			Shop.near(user_lat_long, nearest_distance.to_i, :units => :km) : Shop.all

		# Filter shops by city
		shops_list = city.present? ?
			shops_list.joins(:address).where( addresses: { city: city } ) :
			shops_list

		# Filter shops by province
		shops_list = province.present? ?
			shops_list.joins(:address).where( addresses: { province: province } ) :
			shops_list

		# TODO: Filter shops by ingredients
		# shops_list = ingredient_list.present? ?
		# shops_list.joins(:ingredient).where (ingredients: { name: ingredient_list }) :
		# shops_list

		shops_list
	end

	# Get the address for the shop (for geocoding purposes)
	def get_full_address
		self.address.get_full_address
	end

end
