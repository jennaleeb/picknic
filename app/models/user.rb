class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile
  has_one :dietary_preference

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
end
