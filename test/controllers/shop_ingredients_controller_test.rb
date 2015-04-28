require 'test_helper'

class ShopIngredientsControllerTest < ActionController::TestCase
  setup do
    @shop_ingredient = shop_ingredients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shop_ingredients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shop_ingredient" do
    assert_difference('ShopIngredient.count') do
      post :create, shop_ingredient: { ingredient_id: @shop_ingredient.ingredient_id, shop_id: @shop_ingredient.shop_id }
    end

    assert_redirected_to shop_ingredient_path(assigns(:shop_ingredient))
  end

  test "should show shop_ingredient" do
    get :show, id: @shop_ingredient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shop_ingredient
    assert_response :success
  end

  test "should update shop_ingredient" do
    patch :update, id: @shop_ingredient, shop_ingredient: { ingredient_id: @shop_ingredient.ingredient_id, shop_id: @shop_ingredient.shop_id }
    assert_redirected_to shop_ingredient_path(assigns(:shop_ingredient))
  end

  test "should destroy shop_ingredient" do
    assert_difference('ShopIngredient.count', -1) do
      delete :destroy, id: @shop_ingredient
    end

    assert_redirected_to shop_ingredients_path
  end
end
