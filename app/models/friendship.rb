class Friendship < ActiveRecord::Base
	belongs_to :user
	belongs_to :friend, :class_name => "User"

	def find_friends_diets
	  yummly_diets = []
	  friend_diets = []

	  current_user.friends.each do |friend|
	    friend_diets = DietaryPreference.where(user_id: friend.id)
	  end

	  if friend_diets != nil
	    friend_diets.each do |diet|
	      diet_id = diet.diet_id
	      yummly_diets << Diet.find(diet_id).yummly_diet_id
	    end
	  yummly_diets
	  else
	    yummly_diets = nil
	  end

	end
end
