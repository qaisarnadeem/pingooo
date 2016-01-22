class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :destroy]
  skip_before_action :verify_authenticity_token
  before_filter :authorize_apps_request ,:except => [:create]
  # GET /users
  # GET /users.json
  def index
    @users = initialize_grid(User,:include=>[:country])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    render_404 and return unless  request_json? && current_app_user.present?
    #@user=User.find_by_id(params[:id])
    @user=current_app_user
    #@user=User.find_by_secret_code(params[:id]) unless @user
  end

  # GET /users/new
  def new
    @user = User.new
  end

  def add_diamonds
    render_404 and return unless  request_json? &&  current_app_user
    render :json=>{:message=>"Please specify Number of Diamonds to add",:responce=>"ERROR"} and return if params[:diamond_count].to_i <=0
    current_app_user.increment!(:diamond_count,params[:diamond_count].to_i) 
    render :json=>{:message=>"Diamond Successfully added",:responce=>"SUCCESS",:diamond_count=>current_app_user.diamond_count} and return
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new({:nickname=>params[:nickname]})
    @user=User.new(user_params) unless  request_json?      
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
        format.json { render json: {:message=>"User was successfully  created",:responce=>"SUCCESS",:secret_code=>@user.secret_code}, status: :ok}
      else
        format.html { render :new }
        format.json { render json: {:message=>@user.errors,:responce=>"ERROR"}, status: :unprocessable_entity,:responce=>"ERROR" }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user=User.find_by_id(params[:id])
    @user=User.find_by_secret_code(params[:id]) unless @user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        format.json { render :json=>{:message=>"User updated successfully",:responce=>"SUCCESS"}, status: :ok}
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:nickname, :email, :first_name, :last_name, :country_id, :date_of_birth, :language)
    end
end
