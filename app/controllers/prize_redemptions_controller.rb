class PrizeRedemptionsController < ApplicationController
  before_action :set_prize_redemption, only: [:show, :edit, :update, :destroy]

  # GET /prize_redemptions
  # GET /prize_redemptions.json
  def index
    @prize_redemptions = PrizeRedemption.all
  end

  # GET /prize_redemptions/1
  # GET /prize_redemptions/1.json
  def show
  end

  # GET /prize_redemptions/new
  def new
    @prize_redemption = PrizeRedemption.new
  end

  # GET /prize_redemptions/1/edit
  def edit
  end

  # POST /prize_redemptions
  # POST /prize_redemptions.json
  def create
    @prize_redemption = PrizeRedemption.new(prize_redemption_params)

    respond_to do |format|
      if @prize_redemption.save
        format.html { redirect_to @prize_redemption, notice: 'Prize redemption was successfully created.' }
        format.json { render :show, status: :created, location: @prize_redemption }
      else
        format.html { render :new }
        format.json { render json: @prize_redemption.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prize_redemptions/1
  # PATCH/PUT /prize_redemptions/1.json
  def update
    respond_to do |format|
      if @prize_redemption.update(prize_redemption_params)
        format.html { redirect_to @prize_redemption, notice: 'Prize redemption was successfully updated.' }
        format.json { render :show, status: :ok, location: @prize_redemption }
      else
        format.html { render :edit }
        format.json { render json: @prize_redemption.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prize_redemptions/1
  # DELETE /prize_redemptions/1.json
  def destroy
    @prize_redemption.destroy
    respond_to do |format|
      format.html { redirect_to prize_redemptions_url, notice: 'Prize redemption was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prize_redemption
      @prize_redemption = PrizeRedemption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prize_redemption_params
      params.require(:prize_redemption).permit(:user_id, :game_id, :country_specific_prize_id, :status)
    end
end
