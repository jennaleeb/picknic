class IngredientTypesController < ApplicationController
  before_action :set_ingredient_type, only: [:show, :edit, :update, :destroy]

  # GET /ingredient_types
  # GET /ingredient_types.json
  def index
    @ingredient_types = IngredientType.all
  end

  # GET /ingredient_types/1
  # GET /ingredient_types/1.json
  def show
  end

  # GET /ingredient_types/new
  def new
    @ingredient_type = IngredientType.new
  end

  # GET /ingredient_types/1/edit
  def edit
  end

  # POST /ingredient_types
  # POST /ingredient_types.json
  def create
    @ingredient_type = IngredientType.new(ingredient_type_params)

    respond_to do |format|
      if @ingredient_type.save
        format.html { redirect_to @ingredient_type, notice: 'Ingredient type was successfully created.' }
        format.json { render :show, status: :created, location: @ingredient_type }
      else
        format.html { render :new }
        format.json { render json: @ingredient_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingredient_types/1
  # PATCH/PUT /ingredient_types/1.json
  def update
    respond_to do |format|
      if @ingredient_type.update(ingredient_type_params)
        format.html { redirect_to @ingredient_type, notice: 'Ingredient type was successfully updated.' }
        format.json { render :show, status: :ok, location: @ingredient_type }
      else
        format.html { render :edit }
        format.json { render json: @ingredient_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredient_types/1
  # DELETE /ingredient_types/1.json
  def destroy
    @ingredient_type.destroy
    respond_to do |format|
      format.html { redirect_to ingredient_types_url, notice: 'Ingredient type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient_type
      @ingredient_type = IngredientType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_type_params
      params.require(:ingredient_type).permit(:name)
    end
end
