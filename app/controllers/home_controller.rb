class HomeController < ApplicationController
  def index
    @posts = Post.all
    @posts= Post.order(created_at: :desc).page(params[:page]).per(8)
    @likes = Like.where(user_id: current_user)
  end

end
