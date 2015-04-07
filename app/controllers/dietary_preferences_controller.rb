class DietaryPreferencesController < ApplicationController
  before_action :set_dietary_preference, only: [:show, :edit, :update, :destroy]

  # GET /dietary_preferences
  # GET /dietary_preferences.json
  def index
    @dietary_preferences = DietaryPreference.all
  end

  # GET /dietary_preferences/1
  # GET /dietary_preferences/1.json
  def show
  end

  # GET /dietary_preferences/new
  def new
    @dietary_preference = DietaryPreference.new
  end

  # GET /dietary_preferences/1/edit
  def edit
  end

  # POST /dietary_preferences
  # POST /dietary_preferences.json
  def create
    @dietary_preference = DietaryPreference.new(dietary_preference_params)

    respond_to do |format|
      if @dietary_preference.save
        format.html { redirect_to @dietary_preference, notice: 'Dietary preference was successfully created.' }
        format.json { render :show, status: :created, location: @dietary_preference }
      else
        format.html { render :new }
        format.json { render json: @dietary_preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dietary_preferences/1
  # PATCH/PUT /dietary_preferences/1.json
  def update
    respond_to do |format|
      if @dietary_preference.update(dietary_preference_params)
        format.html { redirect_to @dietary_preference, notice: 'Dietary preference was successfully updated.' }
        format.json { render :show, status: :ok, location: @dietary_preference }
      else
        format.html { render :edit }
        format.json { render json: @dietary_preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dietary_preferences/1
  # DELETE /dietary_preferences/1.json
  def destroy
    @dietary_preference.destroy
    respond_to do |format|
      format.html { redirect_to dietary_preferences_url, notice: 'Dietary preference was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dietary_preference
      @dietary_preference = DietaryPreference.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dietary_preference_params
      params.require(:dietary_preference).permit(:user_id)
    end
end
