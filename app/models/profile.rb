class Profile < ActiveRecord::Base
  belongs_to :user

  validates :first_name, :presence => { message: "You've entered a blank first name for your profile.  Please re-enter."}
  validates :last_name, :presence => { message: "You've entered a blank last name for your profile.  Please re-enter."}
  validates :city, :presence => { message: "You've entered a blank city for your profile.  Please re-enter."}
  validates :postal_code, :presence => { message: "You've entered a blank postal code for your profile.  Please re-enter."}

end
