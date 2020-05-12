class HomeController < ApplicationController
  def index
    @posts = Post.all
    @posts= Post.order(created_at: :desc).limit(5)
    @likes = Like.where(user_id: current_user)
  end
end
