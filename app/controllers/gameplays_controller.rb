class GameplaysController < ApplicationController
  before_action :set_gameplay, only: [:show, :edit, :update, :destroy]
  before_filter :authorize_apps_request
  skip_before_action :verify_authenticity_token
  #before_action :require_app_login?
  # GET /gameplays
  # GET /gameplays.json
  def index
    @gameplays = Gameplay.all
  end

  def winners
    @winners=initialize_grid(Winner.joins(:gameplay=>[:user]).select('users.* , gameplays.* , winners.* , users.email as email')) unless request_json?
    if request_json?
       game=Game.find_by_id(params[:game_id])
       render :json=>{:message=>"We could not find any game with provided id",:responce=>"ERROR"} and return unless  game
       render :json=>{:message=>"This Game is not played yet",:responce=>"ERROR"} and return unless  game.played?  
       winners=game.winners.includes(:user)
       render :json=>{:total_count=>winners.length,:winners=>winners.map{|w| {:game_id=>w.game_id,:chance_number=>w.gameplay.chance_number,:user=>{:id=>w.user_id,:email=>w.user.email,:nickname=>w.user.nickname,:country=>w.user.country.try(:ame),:first_name=>w.user.first_name,:last_name=>w.user.last_name},:distance_from_ball=>w.gameplay.daviation}}} and return
       end
  end

  # GET /gameplays/1
  # GET /gameplays/1.json
  def show
  end

  # GET /gameplays/1/edit
  def edit
  end

  # POST /gameplays
  # POST /gameplays.json
  def create
    @gameplay = Gameplay.new(gameplay_params)
    @gameplay.user_id=current_app_user.id
    @game=Game.find(params[:gameplay][:game_id])
    render :json => {:message=>"We could not find any ongoing game with provided ID",:responce=>"ERROR"} and return unless @game && @game.ongoing?
    gameplays_sofar=@game.gameplays.where(:user_id=>current_app_user.id).count
    render :json=> {:message=>"You have already exhausted all of your available chances",:responce=>"ERROR"} and return if gameplays_sofar >= Game::MAXIMUM_TURNS_ALLOWED
    respond_to do |format|
      if @gameplay.save
        format.json { render json: {:message=>"Gameplay successfully added",:responce=>"SUCCESS"}, status: :created, location: @gameplay }
      else
        format.json { render json: {:message=>@gameplay.errors,:responce=>"ERROR"}, status: :unprocessable_entity }
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
      params.require(:gameplay).permit(:position_x, :position_y, :game_id, :chance_number)
    end
end
