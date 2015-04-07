require 'test_helper'

class DietIngredientTypesControllerTest < ActionController::TestCase
  setup do
    @diet_ingredient_type = diet_ingredient_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:diet_ingredient_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create diet_ingredient_type" do
    assert_difference('DietIngredientType.count') do
      post :create, diet_ingredient_type: { diet_id: @diet_ingredient_type.diet_id, ingredient_type_id: @diet_ingredient_type.ingredient_type_id }
    end

    assert_redirected_to diet_ingredient_type_path(assigns(:diet_ingredient_type))
  end

  test "should show diet_ingredient_type" do
    get :show, id: @diet_ingredient_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @diet_ingredient_type
    assert_response :success
  end

  test "should update diet_ingredient_type" do
    patch :update, id: @diet_ingredient_type, diet_ingredient_type: { diet_id: @diet_ingredient_type.diet_id, ingredient_type_id: @diet_ingredient_type.ingredient_type_id }
    assert_redirected_to diet_ingredient_type_path(assigns(:diet_ingredient_type))
  end

  test "should destroy diet_ingredient_type" do
    assert_difference('DietIngredientType.count', -1) do
      delete :destroy, id: @diet_ingredient_type
    end

    assert_redirected_to diet_ingredient_types_path
  end
end
