class ShopIngredientsController < ApplicationController
  before_action :set_shop_ingredient, only: [:show, :edit, :update, :destroy]

  # GET /shop_ingredients
  # GET /shop_ingredients.json
  def index
    @shop_ingredients = ShopIngredient.all
  end

  # GET /shop_ingredients/1
  # GET /shop_ingredients/1.json
  def show
  end

  # GET /shop_ingredients/new
  def new
    @shop_ingredient = ShopIngredient.new
  end

  # GET /shop_ingredients/1/edit
  def edit
  end

  # POST /shop_ingredients
  # POST /shop_ingredients.json
  def create
    @shop_ingredient = ShopIngredient.new(shop_ingredient_params)

    respond_to do |format|
      if @shop_ingredient.save
        format.html { redirect_to @shop_ingredient, notice: 'Shop ingredient was successfully created.' }
        format.json { render :show, status: :created, location: @shop_ingredient }
      else
        format.html { render :new }
        format.json { render json: @shop_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shop_ingredients/1
  # PATCH/PUT /shop_ingredients/1.json
  def update
    respond_to do |format|
      if @shop_ingredient.update(shop_ingredient_params)
        format.html { redirect_to @shop_ingredient, notice: 'Shop ingredient was successfully updated.' }
        format.json { render :show, status: :ok, location: @shop_ingredient }
      else
        format.html { render :edit }
        format.json { render json: @shop_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shop_ingredients/1
  # DELETE /shop_ingredients/1.json
  def destroy
    @shop_ingredient.destroy
    respond_to do |format|
      format.html { redirect_to shop_ingredients_url, notice: 'Shop ingredient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop_ingredient
      @shop_ingredient = ShopIngredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_ingredient_params
      params.require(:shop_ingredient).permit(:shop_id, :ingredient_id)
    end
end
