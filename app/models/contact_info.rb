class ContactInfo < ActiveRecord::Base
  belongs_to :shop

  # Validation rules
  # All Farmers' Markets must have a telephone number.
  validates :telephone_number, :presence => { message: "You've entered a blank telephone number for the shop. Please re-enter the telephone number."}
end
