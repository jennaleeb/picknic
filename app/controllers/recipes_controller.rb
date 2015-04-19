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

    @results = Yummly.search(
      params[:search_by_all],
      "maxTotalTimeInSeconds" => params[:search_by_time],
      "allowedCourse[]" => params[:search_by_course],
      "allowedAllergy[]" => params[:search_by_allergy],
      "allowedDiet[]" => params[:search_by_diet],
      maxResult: 20)

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
   #  recipe_id = params[:id].to_i

   #  @recipe = Recipe.new

   #  recipe_name = @recipe.name

   #  ShoppingList.create(name: recipe_name)
   #  shopping_list_id = ShoppingList.find_by(name: recipe_name).id
   #  @recipe.recipe_ingredient_quantities.all.each do |recipe_ingredient_qty| 
   #      ShoppingListItem.create( 
   #        shopping_list_id: shopping_list_id, 
   #        ingredient_name: recipe_ingredient_qty.ingredient.name,
   #        ingredient_quantity: recipe_ingredient_qty.quantity,
   #        ingredient_quantity_unit: recipe_ingredient_qty.quantity_unit,
   #        done: false )

   #  end

    #pull out whichever recipe you are clicking on
    recipe = Yummly.find(params[:yummly_id])

    #create new shopping list for each recipe
    s = ShoppingList.create(name: recipe.name)
    shopping_list_id = ShoppingList.find_by(name: recipe.name).id

    #find recipe and ingredient name from yummly
    recipe.ingredients.each do |ingredient|
      r = Recipe.find_or_create_by(name: recipe.name)
      i = Ingredient.find_or_create_by(name: ingredient)
      ShoppingListItem.create(done: nil, shopping_list_id: s.id, ingredient_name: i.name, ingredient_quantity: nil, ingredient_quantity_unit: nil)
    end

    redirect_to shopping_lists_path

  end

  # Add recipe to logged-in user's favourites
  def add_to_favourites
    @recipe = Recipe.create(name: recipe.name)

    user_id = current_user.id

    yummly_id = recipe.id

    recipe_name = recipe.name

    
 

    recipe_id = params[:id].to_i
    
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