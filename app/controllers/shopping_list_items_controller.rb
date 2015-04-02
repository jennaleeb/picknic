class ShoppingListItemsController < ApplicationController
  before_action :set_shopping_list_item, only: [:show, :edit, :update, :destroy]

  # Mark a shopping list item as completed
  def mark_complete
    shopping_list_item_id = params[:id].to_i
    @shopping_list_item = ShoppingListItem.find(shopping_list_item_id)

    @shopping_list_item.mark_done
    @shopping_list_item.save

    redirect_to shopping_list_items_path
  end
  # GET /shopping_list_items
  # GET /shopping_list_items.json
  def index
    @shopping_list_items = ShoppingListItem.all
  end

  # GET /shopping_list_items/1
  # GET /shopping_list_items/1.json
  def show
  end

  # GET /shopping_list_items/new
  def new
    @shopping_list_item = ShoppingListItem.new
  end

  # GET /shopping_list_items/1/edit
  def edit
  end

  # POST /shopping_list_items
  # POST /shopping_list_items.json
  def create
    @shopping_list_item = ShoppingListItem.new(shopping_list_item_params)

    respond_to do |format|
      if @shopping_list_item.save
        format.html { redirect_to @shopping_list_item, notice: 'Shopping list item was successfully created.' }
        format.json { render :show, status: :created, location: @shopping_list_item }
      else
        format.html { render :new }
        format.json { render json: @shopping_list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shopping_list_items/1
  # PATCH/PUT /shopping_list_items/1.json
  def update
    respond_to do |format|
      if @shopping_list_item.update(shopping_list_item_params)
        format.html { redirect_to @shopping_list_item, notice: 'Shopping list item was successfully updated.' }
        format.json { render :show, status: :ok, location: @shopping_list_item }
      else
        format.html { render :edit }
        format.json { render json: @shopping_list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopping_list_items/1
  # DELETE /shopping_list_items/1.json
  def destroy
    @shopping_list_item.destroy
    respond_to do |format|
      format.html { redirect_to shopping_list_items_url, notice: 'Shopping list item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping_list_item
      @shopping_list_item = ShoppingListItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shopping_list_item_params
      params.require(:shopping_list_item).permit(:done, :shopping_list_id, :recipe_ingredient_quantity_id)
    end
end
