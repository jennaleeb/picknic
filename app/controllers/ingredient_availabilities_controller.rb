class IngredientAvailabilitiesController < ApplicationController
	before_action :set_ingredient_availability, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!
	before_action :authorize_user, except: [:index, :show]

	def index
		ingredient_id = params[:ingredient_type]
		month_id = params[:month]

		@ingredients = Ingredient.all

		if ingredient_id.present?
			@ingredients = @ingredients.where(ingredient_type_id: ingredient_id)
		end

		if month_id.present?
			@ingredients = @ingredients.joins(:ingredient_availabilities).where(ingredient_availabilities: {month_id: month_id})
		end
		

	end







	def new
		@ingredient_availability = IngredientAvailability.new
	end

	def create
		@ingredient_availability = IngredientAvailability.new(ingredient_availability_params)
		@ingredient_availability.save

	end




	def destroy
	  @ingredient_availability.destroy
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_ingredient_availability
	  @ingredient_availability = IngredientAvailability.find(params[:id])
	end


	def ingredient_availability_params
	
	  params.require(:ingredient_availability).permit(:ingredient_id, :ingredient_type,:month_ids => [])
	  
	end

	# Only allow admin users to access selected functions
	def authorize_user
	  if !current_user.admin_user? then
	    redirect_to '/', notice: 'You have attempted to access a function that is not available for basic users.'
	  end
	end

end