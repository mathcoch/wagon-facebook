class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  helper_method :current_user
  before_action :require_login

  private
  def require_login
    redirect_to root_url unless session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
