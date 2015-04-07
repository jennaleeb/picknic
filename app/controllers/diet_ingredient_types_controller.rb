class DietIngredientTypesController < ApplicationController
  before_action :set_diet_ingredient_type, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  # GET /diet_ingredient_types
  # GET /diet_ingredient_types.json
  def index
    @diet_ingredient_types = DietIngredientType.all
  end

  # GET /diet_ingredient_types/1
  # GET /diet_ingredient_types/1.json
  def show
  end

  # GET /diet_ingredient_types/new
  def new
    @diet_ingredient_type = DietIngredientType.new
  end

  # GET /diet_ingredient_types/1/edit
  def edit
  end

  # POST /diet_ingredient_types
  # POST /diet_ingredient_types.json
  def create
    @diet_ingredient_type = DietIngredientType.new(diet_ingredient_type_params)

    respond_to do |format|
      if @diet_ingredient_type.save
        format.html { redirect_to @diet_ingredient_type, notice: 'Diet ingredient type was successfully created.' }
        format.json { render :show, status: :created, location: @diet_ingredient_type }
      else
        format.html { render :new }
        format.json { render json: @diet_ingredient_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diet_ingredient_types/1
  # PATCH/PUT /diet_ingredient_types/1.json
  def update
    respond_to do |format|
      if @diet_ingredient_type.update(diet_ingredient_type_params)
        format.html { redirect_to @diet_ingredient_type, notice: 'Diet ingredient type was successfully updated.' }
        format.json { render :show, status: :ok, location: @diet_ingredient_type }
      else
        format.html { render :edit }
        format.json { render json: @diet_ingredient_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diet_ingredient_types/1
  # DELETE /diet_ingredient_types/1.json
  def destroy
    @diet_ingredient_type.destroy
    respond_to do |format|
      format.html { redirect_to diet_ingredient_types_url, notice: 'Diet ingredient type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diet_ingredient_type
      @diet_ingredient_type = DietIngredientType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diet_ingredient_type_params
      params.require(:diet_ingredient_type).permit(:diet_id, :ingredient_type_id)
    end
end
