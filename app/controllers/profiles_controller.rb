class ProfilesController < ApplicationController
  before_action :set_posts_profiles, only: [:index, :update]

  def index
    @post = Post.new
  end

  def update
    profile = Profile.find(params[:id])
    profile.score += 1
    profile.save

    @profiles = Profile.all.order('score DESC')
    @posts = Post.all
    @post = Post.new
    render 'pages/index'
  end

  private
    def set_user
      @profile = Profile.find(params[:id])
    end

    def user_params
      params.require(:profile).permit(:username, :score)
    end
end
