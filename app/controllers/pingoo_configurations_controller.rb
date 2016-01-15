class PingooConfigurationsController < ApplicationController
  before_action :set_pingoo_configuration, only: [:edit, :update]
  before_filter :authorize_apps_request
  # GET /pingoo_configurations
  # GET /pingoo_configurations.json
  def index
    @pingoo_configurations = PingooConfiguration.all
    render :json => {:total_count=>@pingoo_configurations.length,:configurations=>@pingoo_configurations.map{|c| {:title=>c.title,:value=>c.value}}} and return if request_json?
  end


  # GET /pingoo_configurations/new
  def new
    @pingoo_configuration = PingooConfiguration.new
  end

  # GET /pingoo_configurations/1/edit
  def edit
  end

  # POST /pingoo_configurations
  # POST /pingoo_configurations.json
  def create
    @pingoo_configuration = PingooConfiguration.new(pingoo_configuration_params)

    respond_to do |format|
      if @pingoo_configuration.save
        format.html { redirect_to  pingoo_configurations_url, notice: 'Pingoo configuration was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @pingoo_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pingoo_configurations/1
  # PATCH/PUT /pingoo_configurations/1.json
  def update
    respond_to do |format|
      if @pingoo_configuration.update(pingoo_configuration_params)
        format.html { redirect_to  pingoo_configurations_url, notice: 'Pingoo configuration was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @pingoo_configuration.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pingoo_configuration
      @pingoo_configuration = PingooConfiguration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pingoo_configuration_params
      params.require(:pingoo_configuration).permit(:configuration_id, :value)
    end
end
