class User < ActiveRecord::Base

  has_many :friendships
  has_many :friends, :through => :friendships
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # A user has one profile
  has_one :profile

  # A user has many dietary preferences, allergies, excluded ingredients (yummly)
  has_many :dietary_preferences
  has_many :diets, through: :dietary_preferences

  has_many :user_allergies
  has_many :allergies, through: :user_allergies

  has_many :excluded_ingredients

  # A user has many favourite recipes
  has_many :user_favourite_recipes, dependent: :destroy
  has_many :recipes, through: :user_favourite_recipes

  # A user has many shopping lists
  has_many :shopping_lists


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

  # Check if a specific shopping_list (by Yummly ID) is in the user's recipes
  def has_shopping_list_for_recipe?(user_id, yummly_id)
    return self.shopping_lists.has_shopping_list_for_recipe?(user_id, yummly_id)
  end

  # Check if a specific recipe (by Yummly ID) is in the user's recipes
  def has_favourite_recipe?(user_id, yummly_id)
    return self.user_favourite_recipes.has_user_favourites_for_recipe?(user_id, yummly_id)
  end


  # Check if a user can modify a shop.
  # Note: Only admin / vendor users can modify shops
  def can_modify_shops?
    return self.admin_user? || self.vendor_user?
  end

  # Get display name for a user
  def get_display_name
    return self.has_profile? ?
      self.profile.first_name + " " + self.profile.last_name :
      self.email
  end


  # Find the list of ingredient types that the user can eat (for customized recipe search)



  def find_user_diets
    yummly_diets = []


    #Find current user's diets
    user_diets = DietaryPreference.where(user_id: self.id)


    #Iterate through own and friends's diets and place in array yummly_diets
    if user_diets != nil
      user_diets.each do |diet|
        diet_id = diet.diet_id
        yummly_diets << Diet.find(diet_id).yummly_diet_id
      end
      
    yummly_diets
    else
      yummly_diets = nil
    end

  end

  def find_user_allergies
    yummly_allergies = []

    user_allergies = UserAllergy.where(user_id: self.id)

    if user_allergies != nil
      user_allergies.each do |allergy|
        allergy_id = allergy.allergy.id
        yummly_allergies << Allergy.find(allergy_id).yummly_allergy_id
      end
    yummly_allergies
    else
      yummly_allergies = nil
    end

  end

  def find_user_excluded_ingredients
    yummly_excluded_ingredients = []
    user_excluded_ingredients = ExcludedIngredient.where(user_id: self.id)

    if user_excluded_ingredients!= nil
      user_excluded_ingredients.each do |ingredient|
        yummly_excluded_ingredients << ingredient.name
      end
      yummly_excluded_ingredients
    else
      yummly_excluded_ingredients = nil
    end
  end

  def compile_diets
    all_diets = self.find_user_diets

    if self.friends != nil
      self.friends.each do |friend|
        all_diets += friend.find_user_diets
      end
      all_diets
    else
      all_diets
    end
  end

  def compile_allergies
    all_allergies = self.find_user_allergies

    if self.friends != nil
      self.friends.each do |friend|
        all_allergies += friend.find_user_allergies
      end
      all_allergies
    else
      all_allergies
    end
  end

  def compile_excluded_ingredients
    all_excluded_ingredients = self.find_user_excluded_ingredients

    if self.friends != nil
      self.friends.each do |friend|
        all_excluded_ingredients += friend.find_user_excluded_ingredients
      end
      all_excluded_ingredients
    else
      all_excluded_ingredients
    end
  end

end
