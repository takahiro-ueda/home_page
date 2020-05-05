class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      respond_to do |format|
        format.html { redirect_to post_path(params[:post_id])  }
        format.json
      end
      flash[:notice] = "コメントしました"
    else
      flash[:notice] = "コメントできませんでした"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_path(params[:post_id]), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end 

  private
    def comment_params
      params.require(:comment).permit(:content, :post_id, :user_id)
    end
end
