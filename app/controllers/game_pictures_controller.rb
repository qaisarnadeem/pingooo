class GamePicturesController < ApplicationController
  before_action :set_game_picture, only: [:edit, :update, :destroy]
  before_filter :authorize_apps_request

  # GET /game_pictures
  # GET /game_pictures.json
  def index
    @game_pictures = initialize_grid(Game)
  end


  # GET /game_pictures/new
  def new
    @game_picture = GamePicture.new
  end

  # GET /game_pictures/1/edit
  def edit
  end

  # POST /game_pictures
  # POST /game_pictures.json
  def create
    @game_picture = GamePicture.new(game_picture_params)

    respond_to do |format|
      if @game_picture.save
        format.html { redirect_to game_pictures_path, notice: 'Game picture was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /game_pictures/1
  # PATCH/PUT /game_pictures/1.json
  def update
    redirect_to game_pictures_url, notice: 'This Picture has been used in Game play. so cannot be updated' and return if @game_picture.is_used?
    respond_to do |format|
      if @game_picture.update(game_picture_params)
        format.html { redirect_to game_pictures_path, notice: 'Game picture was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /game_pictures/1
  # DELETE /game_pictures/1.json
  def destroy
    redirect_to game_pictures_url, notice: 'This Picture has been used in Game play. so cannot be deleted' and return if @game_picture.is_used?
    @game_picture.destroy
    respond_to do |format|
      format.html { redirect_to game_pictures_url, notice: 'Game picture was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_picture
      @game_picture = GamePicture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_picture_params
      params.require(:game_picture).permit(:picture, :competition_picture) rescue nil
    end
end
