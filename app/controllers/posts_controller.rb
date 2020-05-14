class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    @posts = Post.includes(:user).order(created_at: :desc).page(params[:page]).per(5)
    @likes = Like.where(user_id: current_user)
    
    if params[:category_id]
      # Categoryのデータベースのテーブルから一致するidを取得
      @category = Category.find(params[:category_id])
       
      # category_idと紐づく投稿を取得
      @posts = @category.posts.order(created_at: :desc).all
    else
      # 投稿すべてを取得
      @posts = Post.order(created_at: :desc).all
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @like = 0
    @likes = Like.where(post_id: params[:id])
    @comment = Comment.new
    #新着順で表示
    @comments = @post.comments.includes(:user)#.order(created_at: :desc)
    @category = @post.category_id
  end

  # GET /posts/new
  def new
    @post = Post.new
    # @category = Category.find(params[:category_id])
    @post.post_categories.build
    @category = Category.all
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: '投稿が作成されました。' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if category = @post.categories.update(post_params[:category_id])
        format.html { redirect_to @post, notice: '投稿が更新されました。' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: '削除に成功しました。' }
      format.json { head :no_content }
    end
  end

  def set_category
    # @category = Category.all.order("id ASC").limit(13) # categoryの親を取得
    @category = Category.find(params[:category_id])
    # def category_children  
    #   @category_children = Category.find(params[:postcategory]).children 
    # end
  end

  def category
    Category.find(params[:category_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content, :image, :category_id).merge(user_id: current_user.id)
    end
end
