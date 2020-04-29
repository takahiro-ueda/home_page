class HomeController < ApplicationController
  def index
    @posts = Post.all
    # @posts = Post.includes(:post_images).order(created_at: "DESC").limit(3)
  end
end
