class SuggestionsController < ApplicationController
  before_action :set_suggestion, only: [:show, :update, :destroy]
  before_filter :authorize_apps_request
  skip_before_action :verify_authenticity_token
  # GET /suggestions
  # GET /suggestions.json
  def index
    @suggestions = initialize_grid(Suggestion)
  end



  # POST /suggestions
  # POST /suggestions.json
  def create
    @suggestion = Suggestion.new(suggestion_params)
    @suggestion.user=current_app_user

    respond_to do |format|
      if @suggestion.save
        format.html { redirect_to suggestions_path, notice: 'Suggestion was successfully created.' }
        format.json { render json: {:message=>'Suggestion was successfully created.',:responce=>"SUCCESS"}, status: :created}
      else
        format.html { render :new }
        format.json { render json: {:message=>@suggestion.errors,:responce=>"ERROR"}, status: :ok }
      end
    end
  end


  # DELETE /suggestions/1
  # DELETE /suggestions/1.json
  def destroy
    @suggestion.destroy
    respond_to do |format|
      format.html { redirect_to suggestions_url, notice: 'Suggestion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suggestion
      @suggestion = Suggestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def suggestion_params
      params.require(:suggestion).permit(:subject, :description)
    end
end
