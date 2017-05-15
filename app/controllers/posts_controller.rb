class PostsController < ApplicationController
  def index
    @profiles = Profile.all
    @posts = Post.all.order('score DESC')
  end

  def create
    post = Post.create(post_params)

    @profiles = Profile.all
    @posts = Post.all
    render :index
  end

  def update
    post = Post.find(params[:id])
    post.score += 1
    post.save

    @profiles = Profile.all
    @posts = Post.all.order('score DESC')
    redirect_to posts_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:body, :score, :user_id)
    end
end
