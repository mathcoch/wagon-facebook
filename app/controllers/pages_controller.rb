class PagesController < ApplicationController
  before_action :set_posts_profiles, only: [:index]

  def index
    @post = Post.new
  end
end
