class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /ingredients
  # GET /ingredients.json
  def index
    if params[:ingredient].present? then
      params_decoded = params[:ingredient][:ingr_type]
      case 

        when params_decoded == "Vegan"
          @ingredients = Ingredient.vegan_ingredients.includes(:ingredient_type)
        when params_decoded == "Vegetarian"
          @ingredients = Ingredient.ovo_lacto_vegetarian_ingredients.includes(:ingredient_type)
        when params_decoded == "Dairy"
          @ingredients = Ingredient.dairy_ingredients.includes(:ingredient_type)
        when params_decoded == "Meat"
          @ingredients = Ingredient.meat_ingredients.includes(:ingredient_type)
        when params_decoded == "Seafood"
          @ingredients = Ingredient.seafood_ingredients.includes(:ingredient_type)
        when params_decoded == "Meat and Seafood"
          @ingredients = Ingredient.meat_and_seafood_ingredients.includes(:ingredient_type)
        when params_decoded == "Nuts"
          @ingredients = Ingredient.nut_ingredients.includes(:ingredient_type)
        else
          @ingredients = Ingredient.all.includes(:ingredient_type)
      end
    else
      @ingredients = Ingredient.all.includes(:ingredient_type)
    end
    
  end

  # GET /ingredients/1
  # GET /ingredients/1.json
  def show
  end

  # GET /ingredients/new
  def new
    @ingredient = Ingredient.new
  end

  # GET /ingredients/1/edit
  def edit
  end

  # POST /ingredients
  # POST /ingredients.json
  def create
    @ingredient = Ingredient.new(ingredient_params)

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to @ingredient, notice: 'Ingredient was successfully created.' }
        format.json { render :show, status: :created, location: @ingredient }
      else
        format.html { render :new }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingredients/1
  # PATCH/PUT /ingredients/1.json
  def update
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to @ingredient, notice: 'Ingredient was successfully updated.' }
        format.json { render :show, status: :ok, location: @ingredient }
      else
        format.html { render :edit }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients/1
  # DELETE /ingredients/1.json
  def destroy
    @ingredient.destroy
    respond_to do |format|
      format.html { redirect_to ingredients_url, notice: 'Ingredient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_params
      params.require(:ingredient).permit(:name, :quantity, :quantity_unit, :ingredient_type_id, :months => [])
    end
end
