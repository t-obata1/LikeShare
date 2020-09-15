class UsersController < ApplicationController
before_action :correct_user, only: [:edit, :update, :destroy]
before_action :user_logged_in?,except: [:show, :new, :create] #showとnewとcreateはログインせずとも可能

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:succes] = "ユーザを登録しました"
      redirect_to root_url
    else
      flash[:denger] = "ユーザを登録できませんでした"
      render :new
    end
  end
  
  def edit
     @user = User.find_by(id: params[:id])
  end
  
  def update
    @user.update(user_params)
    flash[:success] = "ユーザ情報を編集しました。"
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    #退会処理
  end

#likesしてる？
#likeする
#like消す　・・・モデルにメソッド書いて使用

private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def correct_user
    @user = current_user.find_by(id: params[:id])
  end
end
