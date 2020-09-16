module SessionsHelper
  
    
  def current_user
    #ログインしているユーザを取得する。 @current_user ||= User.find_by(id: session[:user_id]) でも可能
    if @current_user
      return @current_user
    else
      @current_user = User.find_by(id: session[:user_id])
      return @current_user
    end
  end
  
  

  def logged_in?
    !!current_user
  end
  
end
