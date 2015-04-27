class ShopsController < ApplicationController
  include ApplicationHelper
  before_action :set_shop, only: [:show, :edit, :update, :destroy, :add_to_favourites, :remove_from_favourites]
  before_action :authorize_user, except: [:index, 
    :show, 
    :add_to_favourites, 
    :remove_from_favourites]

  # GET /shops
  # GET /shops.json
  def index
    # Get the user's location, as a latitude-longitude pair.
    latitude_longitude = lat_lng

    # Run a search for the user with the given information.
    @shops = Shop.shops_filter(params[:search_by_name],
        params[:search_by_city],
        params[:search_by_province],
        params[:search_by_nearest_distance],
        latitude_longitude)
  end

  # GET /shops/1
  # GET /shops/1.json
  def show
  end

  # GET /shops/new
  def new
    @shop = Shop.new
    address = @shop.build_address
    contact_info = @shop.build_contact_info
    web_info = @shop.build_web_info
  end

  # GET /shops/1/edit
  def edit
  end

  # POST /shops
  # POST /shops.json
  def create
    @shop = Shop.new(shop_params)

    respond_to do |format|
      if @shop.save
        format.html { redirect_to @shop, notice: 'Shop was successfully created.' }
        format.json { render :show, status: :created, location: @shop }
      else
        format.html { render :new }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shops/1
  # PATCH/PUT /shops/1.json
  def update
    respond_to do |format|
      if @shop.update(shop_params)
        format.html { redirect_to @shop, notice: 'Shop was successfully updated.' }
        format.json { render :show, status: :ok, location: @shop }
      else
        format.html { render :edit }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1
  # DELETE /shops/1.json
  def destroy
    @shop.destroy
    respond_to do |format|
      format.html { redirect_to shops_url, notice: 'Shop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Add shop to logged-in user's favourites
  def add_to_favourites
    user_id = current_user.id
    shop_name = @shop.name

    UserFavouriteShop.create(shop_id: @shop.id, user_id: user_id)

    redirect_to shops_url, 
      notice: "Added the recipe #{shop_name} to your list of favourite recipes"
  end

  # Remove recipe from logged-in user's favourites
  def remove_from_favourites
    user_id = current_user.id
    shop_name = @shop.name

    user_favourite_shop = UserFavouriteShop.find_by(shop_id: @shop.id, user_id: user_id)
    user_favourite_shop.destroy

    redirect_to shops_url, 
      notice: "Removed the recipe #{shop_name} from your list of favourite recipes"
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Shop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # TODO: How to pass the params for addresses and web info?
    def shop_params
       params.require(:shop).permit(:name, 
        address_attributes: [ :address_line1, :address_line2, :city, :province, :country, :postal_code ],
        contact_info_attributes: [ :telephone_number, :fax_number ],
        web_info_attributes: [ :email, :website, :facebook, :twitter ])
    end

    # Only allow admin and vendor users to access selected functions
    def authorize_user
      if !current_user.can_modify_shops? then
        redirect_to '/', notice: 'You have attempted to access a function that is not available for basic users.'
      end
    end
end
