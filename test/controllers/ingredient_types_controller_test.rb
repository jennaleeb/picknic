require 'test_helper'

class IngredientTypesControllerTest < ActionController::TestCase
  setup do
    @ingredient_type = ingredient_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ingredient_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ingredient_type" do
    assert_difference('IngredientType.count') do
      post :create, ingredient_type: { name: @ingredient_type.name }
    end

    assert_redirected_to ingredient_type_path(assigns(:ingredient_type))
  end

  test "should show ingredient_type" do
    get :show, id: @ingredient_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ingredient_type
    assert_response :success
  end

  test "should update ingredient_type" do
    patch :update, id: @ingredient_type, ingredient_type: { name: @ingredient_type.name }
    assert_redirected_to ingredient_type_path(assigns(:ingredient_type))
  end

  test "should destroy ingredient_type" do
    assert_difference('IngredientType.count', -1) do
      delete :destroy, id: @ingredient_type
    end

    assert_redirected_to ingredient_types_path
  end
end
