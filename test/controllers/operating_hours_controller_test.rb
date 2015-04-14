require 'test_helper'

class OperatingHoursControllerTest < ActionController::TestCase
  setup do
    @operating_hour = operating_hours(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:operating_hours)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create operating_hour" do
    assert_difference('OperatingHour.count') do
      post :create, operating_hour: { day_of_week: @operating_hour.day_of_week, end_time: @operating_hour.end_time, is_weekend_hours: @operating_hour.is_weekend_hours, shop_id: @operating_hour.shop_id, start_time: @operating_hour.start_time }
    end

    assert_redirected_to operating_hour_path(assigns(:operating_hour))
  end

  test "should show operating_hour" do
    get :show, id: @operating_hour
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @operating_hour
    assert_response :success
  end

  test "should update operating_hour" do
    patch :update, id: @operating_hour, operating_hour: { day_of_week: @operating_hour.day_of_week, end_time: @operating_hour.end_time, is_weekend_hours: @operating_hour.is_weekend_hours, shop_id: @operating_hour.shop_id, start_time: @operating_hour.start_time }
    assert_redirected_to operating_hour_path(assigns(:operating_hour))
  end

  test "should destroy operating_hour" do
    assert_difference('OperatingHour.count', -1) do
      delete :destroy, id: @operating_hour
    end

    assert_redirected_to operating_hours_path
  end
end
