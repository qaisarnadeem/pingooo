class GameplaysController < ApplicationController
  before_action :set_gameplay, only: [:show, :edit, :update, :destroy]
  before_filter :authorize_apps_request
  # GET /gameplays
  # GET /gameplays.json
  def index
    @gameplays = Gameplay.all
  end

  # GET /gameplays/1
  # GET /gameplays/1.json
  def show
  end

  # GET /gameplays/new
  def new
    @gameplay = Gameplay.new
  end

  # GET /gameplays/1/edit
  def edit
  end

  # POST /gameplays
  # POST /gameplays.json
  def create
    @gameplay = Gameplay.new(gameplay_params)

    respond_to do |format|
      if @gameplay.save
        format.html { redirect_to @gameplay, notice: 'Gameplay was successfully created.' }
        format.json { render :show, status: :created, location: @gameplay }
      else
        format.html { render :new }
        format.json { render json: @gameplay.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gameplays/1
  # PATCH/PUT /gameplays/1.json
  def update
    respond_to do |format|
      if @gameplay.update(gameplay_params)
        format.html { redirect_to @gameplay, notice: 'Gameplay was successfully updated.' }
        format.json { render :show, status: :ok, location: @gameplay }
      else
        format.html { render :edit }
        format.json { render json: @gameplay.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gameplays/1
  # DELETE /gameplays/1.json
  def destroy
    @gameplay.destroy
    respond_to do |format|
      format.html { redirect_to gameplays_url, notice: 'Gameplay was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gameplay
      @gameplay = Gameplay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gameplay_params
      params.require(:gameplay).permit(:postion_x, :position_y, :game_id, :user_id, :chance_number, :is_hit)
    end
end
