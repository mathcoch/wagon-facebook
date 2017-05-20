class PostsController < ApplicationController
  before_action :set_post, only: [:update]

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.save

    @post = Post.new
    render 'pages/index'
  end

  def update
    @post.score += 1
    @post.save

    @post = Post.new
    render 'pages/index'
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:body, :score)
    end
end
