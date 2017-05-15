class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
    if session[:user_id]
      @profiles = Profile.all
      @posts = Post.all
      redirect_to landing_page_url
      return
    end
    render :new, :layout => false
  end

  def create
    @user = User.new(user_params)
    @user.profile = Profile.find_by_username(user_params[:username])
    if @user.save
      redirect_to log_in_url
      return
    else
      render :new, :layout => false
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
