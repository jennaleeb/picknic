class PreferencesController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @excluded_ingredients = ExcludedIngredient.where(user_id: current_user.id)
  end


  def update
    current_user.diet_ids = params[:diet_ids]
    current_user.allergy_ids = params[:allergy_ids]

    excluded_ingredients = params[:preferences][:excluded_ingredients].split(",")

    excluded_ingredients.each do |ingredient|
      ExcludedIngredient.create(name: ingredient, user_id: current_user.id)
    end
      


    redirect_to preferences_path

  end

  private


    # Never trust parameters from the scary internet, only allow the white list through.
    def preference_params
      params.require(:preference).permit(:user_id, :preferences_excluded_ingredients, :diet_ids =>[])
    end
end
