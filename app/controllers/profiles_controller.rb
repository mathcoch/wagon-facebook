class ProfilesController < ApplicationController
  def update
    profile = Profile.find(params[:id])
    profile.score += 1
    profile.save

    @post = Post.new
    redirect_to root_path
  end

  private
    def set_user
      @profile = Profile.find(params[:id])
    end

    def user_params
      params.require(:profile).permit(:username, :score)
    end
end
