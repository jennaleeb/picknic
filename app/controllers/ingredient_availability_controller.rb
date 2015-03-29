class IngredientAvailabilityController < ApplicationController
	def index
		@ingredient_availabilities = IngredientAvailability.all
	end

	def new
		@ingredient_availability = IngredientAvailability.new
	end

	def create
		@ingredient_availability = IngredientAvailability.new(ingredient_availability_params)
		@ingredient_availability.save

		@month = Month.new
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
	  params.require(:ingredient).permit(:name, :ingredient_type_id)
	  params.require(:month).permit(:name, :month_id)

	end

end