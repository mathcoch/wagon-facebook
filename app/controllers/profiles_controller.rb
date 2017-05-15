class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all.order('score DESC')
    @posts = Post.all
  end

  def update
    profile = Profile.find(params[:id])
    profile.score += 1
    profile.save

    @profiles = Profile.all.order('score DESC')
    @posts = Post.all
    redirect_to "#{profiles_url}##{profile.id}"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:profile).permit(:username, :score)
    end
end
