require 'test_helper'

class UserFavouriteShopsControllerTest < ActionController::TestCase
  setup do
    @user_favourite_shop = user_favourite_shops(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_favourite_shops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_favourite_shop" do
    assert_difference('UserFavouriteShop.count') do
      post :create, user_favourite_shop: { shop_id: @user_favourite_shop.shop_id, user_id: @user_favourite_shop.user_id }
    end

    assert_redirected_to user_favourite_shop_path(assigns(:user_favourite_shop))
  end

  test "should show user_favourite_shop" do
    get :show, id: @user_favourite_shop
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_favourite_shop
    assert_response :success
  end

  test "should update user_favourite_shop" do
    patch :update, id: @user_favourite_shop, user_favourite_shop: { shop_id: @user_favourite_shop.shop_id, user_id: @user_favourite_shop.user_id }
    assert_redirected_to user_favourite_shop_path(assigns(:user_favourite_shop))
  end

  test "should destroy user_favourite_shop" do
    assert_difference('UserFavouriteShop.count', -1) do
      delete :destroy, id: @user_favourite_shop
    end

    assert_redirected_to user_favourite_shops_path
  end
end
