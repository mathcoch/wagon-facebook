class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    if session[:user_id]
      @profiles = Profile.all
      @posts = Post.all
      redirect_to landing_page_url
      return
    end
    render :new, :layout => false
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to landing_page_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
