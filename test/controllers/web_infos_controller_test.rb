require 'test_helper'

class WebInfosControllerTest < ActionController::TestCase
  setup do
    @web_info = web_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:web_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create web_info" do
    assert_difference('WebInfo.count') do
      post :create, web_info: { email: @web_info.email, facebook: @web_info.facebook, shop_id: @web_info.shop_id, twitter: @web_info.twitter, website: @web_info.website }
    end

    assert_redirected_to web_info_path(assigns(:web_info))
  end

  test "should show web_info" do
    get :show, id: @web_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @web_info
    assert_response :success
  end

  test "should update web_info" do
    patch :update, id: @web_info, web_info: { email: @web_info.email, facebook: @web_info.facebook, shop_id: @web_info.shop_id, twitter: @web_info.twitter, website: @web_info.website }
    assert_redirected_to web_info_path(assigns(:web_info))
  end

  test "should destroy web_info" do
    assert_difference('WebInfo.count', -1) do
      delete :destroy, id: @web_info
    end

    assert_redirected_to web_infos_path
  end
end
