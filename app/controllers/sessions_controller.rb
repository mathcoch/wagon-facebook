class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :set_posts_profiles, only: [:new]

  def new
    if session[:user_id]
      redirect_to index_path
      return
    end
    render :new, :layout => 'log_and_sign'
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to index_path, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render :new, :layout => 'log_and_sign'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
