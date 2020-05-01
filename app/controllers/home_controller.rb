class HomeController < ApplicationController
  def index
    @posts = Post.all
    @posts= Post.order(created_at: :desc).limit(10)
  end
end
