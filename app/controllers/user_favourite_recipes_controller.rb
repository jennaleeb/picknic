class UserFavouriteRecipesController < ApplicationController
  before_action :set_user_favourite_recipe, only: [:show, :edit, :update, :destroy]

  # GET /user_favourite_recipes
  # GET /user_favourite_recipes.json
  def index
    @user_favourite_recipes = UserFavouriteRecipe.where(user_id: current_user.id)
  end

  # GET /user_favourite_recipes/1
  # GET /user_favourite_recipes/1.json
  def show
  end

  # GET /user_favourite_recipes/new
  def new
    @user_favourite_recipe = UserFavouriteRecipe.new
  end

  # GET /user_favourite_recipes/1/edit
  def edit
  end

  # POST /user_favourite_recipes
  # POST /user_favourite_recipes.json
  def create
    @user_favourite_recipe = UserFavouriteRecipe.new(user_favourite_recipe_params)

    respond_to do |format|
      if @user_favourite_recipe.save
        format.html { redirect_to @user_favourite_recipe, notice: 'User favourite recipe was successfully created.' }
        format.json { render :show, status: :created, location: @user_favourite_recipe }
      else
        format.html { render :new }
        format.json { render json: @user_favourite_recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_favourite_recipes/1
  # PATCH/PUT /user_favourite_recipes/1.json
  def update
    respond_to do |format|
      if @user_favourite_recipe.update(user_favourite_recipe_params)
        format.html { redirect_to @user_favourite_recipe, notice: 'User favourite recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_favourite_recipe }
      else
        format.html { render :edit }
        format.json { render json: @user_favourite_recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_favourite_recipes/1
  # DELETE /user_favourite_recipes/1.json
  def destroy
    @user_favourite_recipe.destroy
    respond_to do |format|
      format.html { redirect_to user_favourite_recipes_url, notice: 'User favourite recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_favourite_recipe
      @user_favourite_recipe = UserFavouriteRecipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_favourite_recipe_params
      params.require(:user_favourite_recipe).permit(:user_id, :recipe_id)
    end
end
