module ApplicationHelper

	# Get the latitude and longitude from the user's current location
	# User may or may not be logged into the system.
	def lat_lng
		# Get user current location from browser cookie information 
		if cookies[:lat_lng].present? then
			@lat_lng = cookies[:lat_lng].split("|")
		# Get user current location by other means
		else
			get_current_location
		end
	end

	 # Get user current location from request information,
	 # or from a test longitude / longitude
	 def get_current_location
	 	if Rails.env.test? || Rails.env.development?
	 		[43.648209, -79.397865]  # Hello HackerYou!
	 	else
	 		request.location
	 	end
	 end
end
