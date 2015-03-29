class IngredientAvailabilityController < ApplicationController
	def index
		@availabilities = IngredientAvailability.all
	end

	def create
		@availability = IngredientAvailability.new(ingredient_availability_params)
		@availability.save
	end

	def destroy
	  @availability.destroy
	end

	def ingredient_availability_params
	  params.require(:ingredient).permit(:name, :ingredient_type_id)
	  params.require(:month).permit(:name, :month_id)
	end
end