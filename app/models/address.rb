class Address < ActiveRecord::Base
  belongs_to :shop

  # Validation rules
  # The fields that form the full address for the shop cannot be blank.
  validates :address_line1, { presence: true }
  validates :city, { presence: true }
  validates :province, { presence: true }
  validates :country, { presence: true }
  validates :postal_code, { presence: true }

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
