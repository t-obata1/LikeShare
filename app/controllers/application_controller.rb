class ApplicationController < ActionController::Base
  include SessionsHelper
  private

  
  def user_logged_in?
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(post)
    @count_likes = post.likes.count
  end
end
