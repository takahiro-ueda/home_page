class LikesController < ApplicationController
  before_action :set_post, only: [:create, :destroy]

  def create
    @like = Like.create(user_id: current_user.id, post_id: params[:post_id])
    @likes = Like.where(post_id: params[:post_id])
    # @posts = Post.all
    # @post = @like.post
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    @like.destroy
    @likes = Like.where(post_id: params[:post_id])
    # @posts = Post.all
    # @post = @like.post
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
  
  # def like_params
  #   params.permit(:post_id)
  # end
end