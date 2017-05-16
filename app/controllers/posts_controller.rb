class PostsController < ApplicationController
  before_action :set_post, only: [:update]
  before_action :set_posts_profiles, only: [:index, :create, :update]

  def index
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.save
    render :index
  end

  def update
    @post.score += 1
    @post.save
    redirect_to posts_url
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:body, :score)
    end
end
