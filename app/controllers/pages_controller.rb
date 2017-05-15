class PagesController < ApplicationController
  def index
    @profiles = Profile.all
    @posts = Post.all
  end
end
