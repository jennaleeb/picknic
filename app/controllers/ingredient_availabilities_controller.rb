class IngredientAvailabilitiesController < ApplicationController
	before_action :set_ingredient_availability, only: [:show, :edit, :update, :destroy]

	def index
		@ingredient_availability = IngredientAvailability.new
		@ingredient_availabilities = IngredientAvailability.all
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
	
	  params.require(:ingredient_availability).permit(:month_id, :ingredient_id)

	end

end