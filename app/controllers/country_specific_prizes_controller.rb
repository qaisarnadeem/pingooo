class CountrySpecificPrizesController < ApplicationController
  before_action :set_country_specific_prize, only: [:show, :edit, :update, :destroy]
  before_filter :authorize_apps_request
  # GET /country_specific_prizes
  # GET /country_specific_prizes.json
  def index
    @country_specific_prizes = CountrySpecificPrize.all
  end

  # GET /country_specific_prizes/1
  # GET /country_specific_prizes/1.json
  def show
  end

  # GET /country_specific_prizes/new
  def new
    @country_specific_prize = CountrySpecificPrize.new
  end

  # GET /country_specific_prizes/1/edit
  def edit
  end

  # POST /country_specific_prizes
  # POST /country_specific_prizes.json
  def create
    @country_specific_prize = CountrySpecificPrize.new(country_specific_prize_params)

    respond_to do |format|
      if @country_specific_prize.save
        format.html { redirect_to country_specific_prizes_path, notice: 'Country specific prize was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /country_specific_prizes/1
  # PATCH/PUT /country_specific_prizes/1.json
  def update
    respond_to do |format|
      if @country_specific_prize.update(country_specific_prize_params)
        format.html { redirect_to country_specific_prizes_path, notice: 'Country specific prize was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /country_specific_prizes/1
  # DELETE /country_specific_prizes/1.json
  def destroy
    @country_specific_prize.destroy
    respond_to do |format|
      format.html { redirect_to country_specific_prizes_url, notice: 'Country specific prize was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country_specific_prize
      @country_specific_prize = CountrySpecificPrize.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def country_specific_prize_params
      params.require(:country_specific_prize).permit(:amount, :status, :user_id, :country_id,:prize_category_id)
    end
end
