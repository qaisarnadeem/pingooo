class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  rescue_from ActionController::RoutingError, :with =>:render_404
  before_filter :prepend_json_views
  before_action :set_layout
  before_action :authorize_apps
  before_action :authenticate_admin_user! ,:unless => 'skip_admin_check'
  #layout :set_layout

  def render_404
    render 'main/404' ,:status=>404,:formats=> nil and return
  end

  protected
  def skip_admin_check
     request_json? || (params[:action] =~/get_pictures/i && params[:controller] =~/games/i)
  end

  def request_json?
    request.format && request.format.json?
  end

  def prepend_json_views
     prepend_view_path("app/json_views") if request_json?
  end

  def set_layout
      request_json? ? false : 'application'
  end

  def authorize_apps_request
     if request_json?
       user=User.find_by_secret_code(params[:secret_code])
       render 'main/404' ,:status=>401 and return  if params[:app_secret].to_s != User::APP_SECRET || user.blank?
       session[:app_user_id]= user.try(:id)
     end
  end

  def authorize_apps
    if request_json?
      render 'main/404' ,:status=>401 and return  if params[:app_secret].to_s != User::APP_SECRET
    end
  end

  def require_app_login?
    render 'main/404' ,:formats=>nil unless current_app_user
  end

  def current_app_user
    @current_app_user ||=User.find_by_id(session[:app_user_id]) if request_json?
  end

  def admin_user?
    current_admin_user
  end


  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    new_session_path(:admin_user)
  end
end
