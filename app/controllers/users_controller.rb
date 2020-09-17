class UsersController < ApplicationController
before_action :correct_user, only: [:update, :destroy, :edit] #他人は実行不可
before_action :user_logged_in?,except: [:new, :create] #newとcreateはログインせずとも可能

  def show
    @user = User.find_by(id: params[:id])
    @user_post = @user.posts.all.order(created_at: :desc)
    # @like = Like.new
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "ユーザを登録しました"
      redirect_to login_path
    else
      flash[:denger] = "ユーザを登録できませんでした"
      render :new
    end
  end
  
  def edit
    # @user = User.find_by(id: params[:id])
  end
  
  def update
    if @user.update(user_params)
     flash[:success] = "ユーザ情報を編集しました。"
     redirect_back(fallback_location: root_path)
    else
     flash[:danger] = "編集が出来ませんでした。"
     redirect_to root_path
    end
  end
  
  def destroy
    #退会処理
  end
  
  def likes
    @user = User.find(params[:id])
    @likes = @user.like_posts.page(params[:page])
    counts(@user)
  end


private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
   def correct_user
    @user = current_user
     unless @user
       redirect_to root_url
     end
   end
  
end
