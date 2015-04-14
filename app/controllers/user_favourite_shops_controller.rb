class UserFavouriteShopsController < ApplicationController
  before_action :set_user_favourite_shop, only: [:show, :edit, :update, :destroy]

  # GET /user_favourite_shops
  # GET /user_favourite_shops.json
  def index
    @user_favourite_shops = UserFavouriteShop.all
  end

  # GET /user_favourite_shops/1
  # GET /user_favourite_shops/1.json
  def show
  end

  # GET /user_favourite_shops/new
  def new
    @user_favourite_shop = UserFavouriteShop.new
  end

  # GET /user_favourite_shops/1/edit
  def edit
  end

  # POST /user_favourite_shops
  # POST /user_favourite_shops.json
  def create
    @user_favourite_shop = UserFavouriteShop.new(user_favourite_shop_params)

    respond_to do |format|
      if @user_favourite_shop.save
        format.html { redirect_to @user_favourite_shop, notice: 'User favourite shop was successfully created.' }
        format.json { render :show, status: :created, location: @user_favourite_shop }
      else
        format.html { render :new }
        format.json { render json: @user_favourite_shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_favourite_shops/1
  # PATCH/PUT /user_favourite_shops/1.json
  def update
    respond_to do |format|
      if @user_favourite_shop.update(user_favourite_shop_params)
        format.html { redirect_to @user_favourite_shop, notice: 'User favourite shop was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_favourite_shop }
      else
        format.html { render :edit }
        format.json { render json: @user_favourite_shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_favourite_shops/1
  # DELETE /user_favourite_shops/1.json
  def destroy
    @user_favourite_shop.destroy
    respond_to do |format|
      format.html { redirect_to user_favourite_shops_url, notice: 'User favourite shop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_favourite_shop
      @user_favourite_shop = UserFavouriteShop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_favourite_shop_params
      params.require(:user_favourite_shop).permit(:user_id, :shop_id)
    end
end
