class PostsController < ApplicationController
  before_action :set_post, only: [:update]

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.save

    @post = Post.new
    # render 'pages/index'
    redirect_to root_path
  end

  def update
    @post.score += 1
    @post.save

    @post = Post.new
    redirect_to root_path
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:body, :score)
    end
end
