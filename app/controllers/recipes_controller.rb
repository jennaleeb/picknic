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

    if params[:search_by_all].present?
      @results = Yummly.search(params[:search_by_all], maxResult: 1)
    else
      @results = Yummly.search('', maxResult: 1)
    end


    if params[:recipe].present?
      if params[:recipe][:prep_time].present?
        prep_time = params[:recipe][:prep_time].to_i
      else
        prep_time = 120
      end

      if params[:recipe][:meal_type].present?
        meal_type = params[:recipe][:meal_type]
      else
        meal_type = Recipe::MEAL_TYPES
      end

      if params[:recipe][:ingredient_type_picker].present?
        ingredient_type = params[:recipe][:ingredient_type_picker]
      else
        ingredient_type = Ingredient::INGREDIENT_TYPES
      end

      @recipes = Recipe.recipe_filter(prep_time, meal_type, ingredient_type)
    else
      @recipes = Recipe.all
    end

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

  # Generate shopping list for the recipe (not yet tested)
  def generate_shopping_list
    recipe_id = params[:id].to_i
    @recipe = Recipe.find(recipe_id)

    recipe_name = @recipe.name

    ShoppingList.create(name: recipe_name)
    shopping_list_id = ShoppingList.find_by(name: recipe_name).id
    @recipe.recipe_ingredient_quantities.all.each do |recipe_ingredient_qty| 
        ShoppingListItem.create( 
          shopping_list_id: shopping_list_id, 
          ingredient_name: recipe_ingredient_qty.ingredient.name,
          ingredient_quantity: recipe_ingredient_qty.quantity,
          ingredient_quantity_unit: recipe_ingredient_qty.quantity_unit,
          done: false )

    end

   redirect_to shopping_list_items_url, notice: "You have created a shopping list: #{recipe_name}"
  end

  # Add recipe to logged-in user's favourites
  def add_to_favourites
    user_id = current_user.id
    recipe_id = params[:id].to_i
    @recipe = Recipe.find(recipe_id)
    recipe_name = @recipe.name

    UserFavouriteRecipe.create(recipe_id: recipe_id, user_id: user_id)

    redirect_to recipes_url, notice: "Added the recipe #{recipe_name} to your list of favourite recipes"
  end

  # Remove recipe from logged-in user's favourites
  def remove_from_favourites
    user_id = current_user.id
    recipe_id = params[:id].to_i
    @recipe = Recipe.find(recipe_id)
    recipe_name = @recipe.name

    user_favourite_recipe = UserFavouriteRecipe.find_by(recipe_id: recipe_id, user_id: user_id)
    user_favourite_recipe.destroy

    redirect_to recipes_url, notice: "Removed the recipe #{recipe_name} from your list of favourite recipes"
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