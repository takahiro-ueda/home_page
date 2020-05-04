class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(params[:post_id])}
        format.json
        flash[:success] = "コメントしました"
        # redirect_to 'index'
      else
        flash[:success] = "コメントできませんでした"
        # redirect_to 'index'
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    # redirect_to 'index'
  end 

  private
    def comment_params
      params.require(:comment).permit(:content, :post_id, :user_id)
    end
end
