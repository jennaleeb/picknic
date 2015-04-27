class DietaryPreference < ActiveRecord::Base
  belongs_to :user
  belongs_to :diet

  def find_user_diets
  	user_diets = DietaryPreference.where(user_id: current_user.id)
  	if user_diets != nil
  		user_diets.each do |diet|
  			diet_id = diet.diet_id
  			yummly_diet = Diet.find(diet_id).yummly_diet_id
  		end
  	else
  		yummly_diet = nil
  	end

  end
end
