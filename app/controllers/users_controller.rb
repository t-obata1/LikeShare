class UsersController < ApplicationController
    
  def show
   @user = User.find(params[:id])
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
    
  end
  
  def destroy
  
  end

private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
