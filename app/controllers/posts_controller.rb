class PostsController < ApplicationController
before_action :correct_user, only:[:edit, :update, :destroy]
before_action :user_logged_in?,except: [:index, :show]


  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿しました。"
      redirect_to root_url
    else
      flash[:danger] = "投稿に失敗しました"
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
   @post = Post.find_by(id: params[:id])
  end

  def update
    @post.update(post_params)
    flash[:success] = "投稿を編集しました"
    redirect_to @post
  end

  def destroy
    @post.destroy
    flash[:success] = "投稿を削除しました。"
    redirect_to root_url
  end

 private

  def post_params
    params.require(:post).permit(:title, :content_1, :content_2, :content_3, :img, :remove_img)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
     unless @post
       redirect_to root_url
     end
  end

end