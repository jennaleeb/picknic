class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # A user has one profile
  has_one :profile

  # A user has many dietary preference, and can follow many diets
  has_many :dietary_preferences
  has_many :diets, through: :dietary_preferences

  # Check if a user is an admin user
  def admin_user?
  	return self.user_category == "admin"
  end

  # Check if a user is a vendor
  def vendor_user?
  	return self.user_category == "vendor"
  end

  # Check if a user has a profile
  def has_profile?
    return self.profile.present?
  end

  # Check if a user has dietary preferences set
  def has_dietary_preferences?
    return self.dietary_preference.present?
  end

  # Find the list of ingredient types that the user can eat (for customized recipe search)
end
