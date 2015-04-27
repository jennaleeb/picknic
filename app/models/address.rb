class Address < ActiveRecord::Base
  belongs_to :shop

  # Validation rules
  # The fields that form the full address for the shop cannot be blank.
  validates :address_line1, :presence => { message: "You've entered a blank 1st line for the shop.  Please re-enter - this information is necessary for Google Maps search."}
  validates :city, :presence => { message: "You've entered a blank city.  Please re-enter - this information is necessary for Google Maps search."}
  validates :province, :presence => { message: "You've entered a blank province.  Please re-enter - this information is necessary for Google Maps search."}
  validates :country, :presence => { message: "You've entered a blank country.  Please re-enter - this information is necessary for Google Maps search."}
  validates :postal_code, :presence => { message: "You've entered a blank postal code.  Please re-enter - this information is necessary for Google Maps search."}

  # Obtain the full address for the shop.
  def get_full_address
  	"#{self.address_line1}, #{self.city}, #{self.province}, #{self.country} #{self.postal_code}"
  end

  # Obtain the encoded full address for the shop, for Google Maps.
  def get_google_maps_address
  	ERB::Util.url_encode(self.get_full_address)
  end

  # TODO: Obtain latitude and longitude data for the address.


end
