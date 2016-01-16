class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :set_game_from_game_picture ,:only => [:get_pictures]
  before_filter :authorize_apps_request
  before_action :authorize_pictures ,:only => [:get_pictures]

  # GET /games
  # GET /games.json
  def index
    @games = initialize_grid(Game)
  end

  def today_game
      @game=Game.on_going.last
      render :json => {:message=>"There is no on going game right now. Please come back later"} and return unless @game
  end


  def get_pictures
    picture= params[:attachment] =~ /competition_pictures/i  ? @game.competition_picture : @game.picture
    send_file picture.path, :type => picture.content_type
  end

  # GET /games/new
  def new
    @game = Game.new(:number_of_winner=>PingooConfiguration.number_of_winners)
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to game_pictures_path, notice: 'Game was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to game_pictures_path, notice: 'Game was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:title, :position_x, :position_y, :number_of_winner,:picture,:competition_picture,:is_active)
    end

    def authorize_pictures
      return if admin_user?
      render_404 unless @game
      render_404 unless ["pictures","competition_pictures"].include?(params[:attachment])
      render_404 if @game.upcoming? || (@game.ongoing? && params[:attachment] != 'pictures')
    end

  def set_game_from_game_picture
      @game=Game.find(params[:id])
  end

end
