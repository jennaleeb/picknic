class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authorize_user, except: [:index, 
    :show, 
    :generate_shopping_list, 
    :add_to_favourites, 
    :remove_from_favourites]

  # GET /recipes
  # GET /recipes.json
  def index

    # Grab user's diets as saved in profile and pass it into the search
    user_diets = current_user.find_user_diets

    if params[:search_by_diet].present?
      allowed_diets_in_search = (user_diets << params[:search_by_diet]).flatten!
    else
      allowed_diets_in_search = user_diets
    end

    # Grab user's allergies as saved in profile and pass it into the search
    user_allergies = current_user.find_user_allergies

    if params[:search_by_allergy].present?
      allowed_allergies_in_search = (user_allergies << params[:search_by_allergy]).flatten!
    else
      allowed_allergies_in_search = user_allergies
    end

    user_excluded_ingredients = current_user.find_user_excluded_ingredients

    @results = Yummly.search(
      params[:search_by_all],
      "maxTotalTimeInSeconds" => params[:search_by_time],
      "allowedCourse[]" => params[:search_by_course],
      "allowedAllergy[]" => allowed_allergies_in_search,
      "allowedDiet[]" => allowed_diets_in_search,
      "excludedIngredient[]" => user_excluded_ingredients,
      maxResult: 50);
      

  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    recipe_id = params[:id].to_i
    @recipe = Recipe.find(recipe_id)
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
    recipe_id = params[:id].to_i
    @recipe = Recipe.find(recipe_id)
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

  # Generate shopping list for the recipe
  def generate_shopping_list

    #pull out whichever recipe you are clicking on
    recipe = Yummly.find(params[:yummly_id])

    #create new shopping list for each recipe
    s = ShoppingList.create(name: recipe.name, 
      yummly_id: params[:yummly_id],
      user_id: current_user.id)

    #find recipe and ingredient name from yummly
    recipe.ingredients.each do |ingredient|
      r = Recipe.find_or_create_by(name: recipe.name)
      ShoppingListItem.create(done: nil, shopping_list_id: s.id, ingredient_name: ingredient, ingredient_quantity: nil, ingredient_quantity_unit: nil)
    end

    redirect_to recipes_url, notice: "Added recipe to your shopping lists"

  end

  # Remove shopping list for recipe
  def remove_shopping_list
    user_id = current_user.id
    yummly_id = params[:yummly_id]

    shopping_list = ShoppingList.find_by(yummly_id: yummly_id, user_id: user_id)
    shopping_list.destroy

    redirect_to recipes_url, notice: "Removed recipe from your shopping lists"
  end

  # Add recipe to logged-in user's favourites
  def add_to_favourites
  
    #pull out whichever recipe you are clicking on
    yummly_id = params[:yummly_id]
    recipe = Yummly.find(yummly_id)

    # make new instance of that recipe
    r = Recipe.find_or_create_by(name: recipe.name)

    UserFavouriteRecipe.create(recipe_id: r.id, user_id: current_user.id, yummly_id: yummly_id)

    redirect_to recipes_url, notice: "Added recipe from your list of favourite recipes"

  end

  # Remove recipe from logged-in user's favourites
  def remove_from_favourites
    user_id = current_user.id
    yummly_id = params[:yummly_id]

    user_favourite_recipe = UserFavouriteRecipe.find_by(yummly_id: yummly_id, user_id: user_id)
    user_favourite_recipe.destroy

    redirect_to recipes_url, notice: "Removed recipe from your list of favourite recipes"
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

    # Only allow admin users to access selected functions
    def authorize_user
      if !current_user.admin_user? then
        redirect_to '/', notice: 'You have attempted to access a function that is not available for basic users.'
      end
    end
end

# r.select { |rec| rec.total_time_in_seconds > 10000 }
# r.select do |rec|
#   rec.total_time_in_seconds > 10000
#   # condition
# end