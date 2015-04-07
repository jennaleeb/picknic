require 'test_helper'

class DietaryPreferencesControllerTest < ActionController::TestCase
  setup do
    @dietary_preference = dietary_preferences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dietary_preferences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dietary_preference" do
    assert_difference('DietaryPreference.count') do
      post :create, dietary_preference: { user_id: @dietary_preference.user_id }
    end

    assert_redirected_to dietary_preference_path(assigns(:dietary_preference))
  end

  test "should show dietary_preference" do
    get :show, id: @dietary_preference
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dietary_preference
    assert_response :success
  end

  test "should update dietary_preference" do
    patch :update, id: @dietary_preference, dietary_preference: { user_id: @dietary_preference.user_id }
    assert_redirected_to dietary_preference_path(assigns(:dietary_preference))
  end

  test "should destroy dietary_preference" do
    assert_difference('DietaryPreference.count', -1) do
      delete :destroy, id: @dietary_preference
    end

    assert_redirected_to dietary_preferences_path
  end
end
