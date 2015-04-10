require 'test_helper'

class UserFavouriteRecipesControllerTest < ActionController::TestCase
  setup do
    @user_favourite_recipe = user_favourite_recipes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_favourite_recipes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_favourite_recipe" do
    assert_difference('UserFavouriteRecipe.count') do
      post :create, user_favourite_recipe: { recipe_id: @user_favourite_recipe.recipe_id, user_id: @user_favourite_recipe.user_id }
    end

    assert_redirected_to user_favourite_recipe_path(assigns(:user_favourite_recipe))
  end

  test "should show user_favourite_recipe" do
    get :show, id: @user_favourite_recipe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_favourite_recipe
    assert_response :success
  end

  test "should update user_favourite_recipe" do
    patch :update, id: @user_favourite_recipe, user_favourite_recipe: { recipe_id: @user_favourite_recipe.recipe_id, user_id: @user_favourite_recipe.user_id }
    assert_redirected_to user_favourite_recipe_path(assigns(:user_favourite_recipe))
  end

  test "should destroy user_favourite_recipe" do
    assert_difference('UserFavouriteRecipe.count', -1) do
      delete :destroy, id: @user_favourite_recipe
    end

    assert_redirected_to user_favourite_recipes_path
  end
end
