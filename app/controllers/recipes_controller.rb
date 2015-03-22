class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    if params[:recipe].present?
     
      prep_time = params[:recipe][:prep_time].to_i
      case 
      when prep_time <= 15
        @recipes = Recipe.where(prep_time: 15)
      when prep_time <= 30
        @recipes = Recipe.where(prep_time: (15)..(30))
      when prep_time <= 60
        @recipes = Recipe.where(prep_time: (15)..(60))
      when prep_time <= 120
        @recipes = Recipe.where(prep_time: (15)..(120))
      when prep_time > 120
        @recipes = Recipe.all
      else
        @recipes = Recipe.all
      end

      meal_type = params[:recipe][:meal_type]
  
      case 
      when meal_type == "Appetizer"
        @recipes = Recipe.where(meal_type: "Appetizer")
      when meal_type == "Entree"
        @recipes = Recipe.where(meal_type: "Entree")
      when meal_type == "Side"
        @recipes = Recipe.where(meal_type: "Side")
      when meal_type == "Dessert"
        @recipes = Recipe.where(meal_type: "Dessert")
      else
        @recipes = Recipe.all
        
      end

    else
      @recipes = Recipe.all
    end

  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :instructions, :prep_time, :meal_type)
    end
end
