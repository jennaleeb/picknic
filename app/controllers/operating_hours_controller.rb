class OperatingHoursController < ApplicationController
  before_action :set_operating_hour, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authorize_user

  # GET /operating_hours
  # GET /operating_hours.json
  def index
    @operating_hours = OperatingHour.all
  end

  # GET /operating_hours/1
  # GET /operating_hours/1.json
  def show
  end

  # GET /operating_hours/new
  def new
    @operating_hour = OperatingHour.new
  end

  # GET /operating_hours/1/edit
  def edit
  end

  # POST /operating_hours
  # POST /operating_hours.json
  def create
    @operating_hour = OperatingHour.new(operating_hour_params)

    respond_to do |format|
      if @operating_hour.save
        format.html { redirect_to @operating_hour, notice: 'Operating hour was successfully created.' }
        format.json { render :show, status: :created, location: @operating_hour }
      else
        format.html { render :new }
        format.json { render json: @operating_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operating_hours/1
  # PATCH/PUT /operating_hours/1.json
  def update
    respond_to do |format|
      if @operating_hour.update(operating_hour_params)
        format.html { redirect_to @operating_hour, notice: 'Operating hour was successfully updated.' }
        format.json { render :show, status: :ok, location: @operating_hour }
      else
        format.html { render :edit }
        format.json { render json: @operating_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operating_hours/1
  # DELETE /operating_hours/1.json
  def destroy
    @operating_hour.destroy
    respond_to do |format|
      format.html { redirect_to operating_hours_url, notice: 'Operating hour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operating_hour
      @operating_hour = OperatingHour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def operating_hour_params
      params.require(:operating_hour).permit(:day_of_week, :start_time, :end_time, :is_weekend_hours, :shop_id)
    end

    # Only allow admin and vendor users to access selected functions
    def authorize_user
      if !current_user.can_modify_shops? then
        redirect_to '/', notice: 'You have attempted to access a function that is not available for basic users.'
      end
    end
end
