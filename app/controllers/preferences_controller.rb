class PreferencesController < ApplicationController
  before_action :authenticate_user!
  
  def show
  end


  def update
    current_user.diet_ids = params[:diet_ids]
    current_user.allergy_ids = params[:allergy_ids]

    redirect_to preferences_path

  end

  private


    # Never trust parameters from the scary internet, only allow the white list through.
    def preference_params
      params.require(:preference).permit(:user_id, :diet_ids =>[])
    end
end
