class ContactInfo < ActiveRecord::Base
  belongs_to :shop

  # Validation rules
  # All Farmers' Markets must have a telephone number.
  validates :telephone_number, { presence: true }
end
