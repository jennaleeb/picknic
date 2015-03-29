require 'test_helper'

class RecipeIngredientQuantitiesControllerTest < ActionController::TestCase
  setup do
    @recipe_ingredient_quantity = recipe_ingredient_quantities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recipe_ingredient_quantities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recipe_ingredient_quantity" do
    assert_difference('RecipeIngredientQuantity.count') do
      post :create, recipe_ingredient_quantity: { ingredient_id: @recipe_ingredient_quantity.ingredient_id, quantity: @recipe_ingredient_quantity.quantity, quantity_unit: @recipe_ingredient_quantity.quantity_unit, recipe_id: @recipe_ingredient_quantity.recipe_id }
    end

    assert_redirected_to recipe_ingredient_quantity_path(assigns(:recipe_ingredient_quantity))
  end

  test "should show recipe_ingredient_quantity" do
    get :show, id: @recipe_ingredient_quantity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recipe_ingredient_quantity
    assert_response :success
  end

  test "should update recipe_ingredient_quantity" do
    patch :update, id: @recipe_ingredient_quantity, recipe_ingredient_quantity: { ingredient_id: @recipe_ingredient_quantity.ingredient_id, quantity: @recipe_ingredient_quantity.quantity, quantity_unit: @recipe_ingredient_quantity.quantity_unit, recipe_id: @recipe_ingredient_quantity.recipe_id }
    assert_redirected_to recipe_ingredient_quantity_path(assigns(:recipe_ingredient_quantity))
  end

  test "should destroy recipe_ingredient_quantity" do
    assert_difference('RecipeIngredientQuantity.count', -1) do
      delete :destroy, id: @recipe_ingredient_quantity
    end

    assert_redirected_to recipe_ingredient_quantities_path
  end
end
