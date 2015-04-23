class WebInfosController < ApplicationController
  before_action :set_web_info, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authorize_user

  # GET /web_infos
  # GET /web_infos.json
  def index
    @web_infos = WebInfo.all
  end

  # GET /web_infos/1
  # GET /web_infos/1.json
  def show
  end

  # GET /web_infos/new
  def new
    @web_info = WebInfo.new
  end

  # GET /web_infos/1/edit
  def edit
  end

  # POST /web_infos
  # POST /web_infos.json
  def create
    @web_info = WebInfo.new(web_info_params)

    respond_to do |format|
      if @web_info.save
        format.html { redirect_to @web_info, notice: 'Web info was successfully created.' }
        format.json { render :show, status: :created, location: @web_info }
      else
        format.html { render :new }
        format.json { render json: @web_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /web_infos/1
  # PATCH/PUT /web_infos/1.json
  def update
    respond_to do |format|
      if @web_info.update(web_info_params)
        format.html { redirect_to @web_info, notice: 'Web info was successfully updated.' }
        format.json { render :show, status: :ok, location: @web_info }
      else
        format.html { render :edit }
        format.json { render json: @web_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /web_infos/1
  # DELETE /web_infos/1.json
  def destroy
    @web_info.destroy
    respond_to do |format|
      format.html { redirect_to web_infos_url, notice: 'Web info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_web_info
      @web_info = WebInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def web_info_params
      params.require(:web_info).permit(:email, :website, :facebook, :twitter, :shop_id)
    end

    # Only allow admin and vendor users to access selected functions
    def authorize_user
      if !current_user.can_modify_shops? then
        redirect_to '/', notice: 'You have attempted to access a function that is not available for basic users.'
      end
    end
end
