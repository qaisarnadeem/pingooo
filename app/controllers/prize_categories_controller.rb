class PrizeCategoriesController < ApplicationController
  before_action :set_prize_category, only: [:show, :edit, :update, :destroy]
  before_filter :authorize_apps_request
  # GET /prize_categories
  # GET /prize_categories.json
  def index
    @prize_categories = initialize_grid(PrizeCategory)
  end

  # GET /prize_categories/new
  def new
    @prize_category = PrizeCategory.new
  end

  # GET /prize_categories/1/edit
  def edit
  end

  # POST /prize_categories
  # POST /prize_categories.json
  def create
    @prize_category = PrizeCategory.new(prize_category_params)

    respond_to do |format|

     if PrizeCategory.transaction do
        @prize_category.save
        @prize_category.set_countries_for_prizes params[:countries_ids]
      end
        format.html { redirect_to prize_categories_path, notice: 'Prize category was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /prize_categories/1
  # PATCH/PUT /prize_categories/1.json
  def update
    respond_to do |format|
      if PrizeCategory.transaction do
        @prize_category.update(prize_category_params)
        @prize_category.set_countries_for_prizes params[:countries_ids]
      end
        format.html { redirect_to prize_categories_path, notice: 'Prize category was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /prize_categories/1
  # DELETE /prize_categories/1.json
  def destroy
    @prize_category.destroy
    respond_to do |format|
      format.html { redirect_to prize_categories_url, notice: 'Prize category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prize_category
      @prize_category = PrizeCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prize_category_params
      params.require(:prize_category).permit(:title, :description, :amount,:icon,:currency_unit)
    end
end
