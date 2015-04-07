class RecipeIngredientQuantitiesController < ApplicationController
  before_action :set_recipe_ingredient_quantity, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /recipe_ingredient_quantities
  # GET /recipe_ingredient_quantities.json
  def index
    @recipe_ingredient_quantities = RecipeIngredientQuantity.all
  end

  # GET /recipe_ingredient_quantities/1
  # GET /recipe_ingredient_quantities/1.json
  def show
  end

  # GET /recipe_ingredient_quantities/new
  def new
    @recipe_ingredient_quantity = RecipeIngredientQuantity.new
  end

  # GET /recipe_ingredient_quantities/1/edit
  def edit
  end

  # POST /recipe_ingredient_quantities
  # POST /recipe_ingredient_quantities.json
  def create
    @recipe_ingredient_quantity = RecipeIngredientQuantity.new(recipe_ingredient_quantity_params)

    respond_to do |format|
      if @recipe_ingredient_quantity.save
        format.html { redirect_to @recipe_ingredient_quantity, notice: 'Recipe ingredient quantity was successfully created.' }
        format.json { render :show, status: :created, location: @recipe_ingredient_quantity }
      else
        format.html { render :new }
        format.json { render json: @recipe_ingredient_quantity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_ingredient_quantities/1
  # PATCH/PUT /recipe_ingredient_quantities/1.json
  def update
    respond_to do |format|
      if @recipe_ingredient_quantity.update(recipe_ingredient_quantity_params)
        format.html { redirect_to @recipe_ingredient_quantity, notice: 'Recipe ingredient quantity was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe_ingredient_quantity }
      else
        format.html { render :edit }
        format.json { render json: @recipe_ingredient_quantity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_ingredient_quantities/1
  # DELETE /recipe_ingredient_quantities/1.json
  def destroy
    @recipe_ingredient_quantity.destroy
    respond_to do |format|
      format.html { redirect_to recipe_ingredient_quantities_url, notice: 'Recipe ingredient quantity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_ingredient_quantity
      @recipe_ingredient_quantity = RecipeIngredientQuantity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_ingredient_quantity_params
      params.require(:recipe_ingredient_quantity).permit(:recipe_id, :ingredient_id, :quantity, :quantity_unit)
    end
end
