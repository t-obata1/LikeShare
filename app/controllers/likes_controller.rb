class LikesController < ApplicationController
  before_action :user_logged_in?
   
  def create
    post = Post.find(params[:post_id])
    current_user.like(post)
    flash[:success] = "投稿をお気に入りしました"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    post = Post.find(params[:post_id])
    current_user.unlike(post)
    flash[:success] = '投稿のお気に入りを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  # def like(post) 
  #   likes.find_or_create_by(post_id: post_id)
  # end
  
  # def unlike(post) 
  #   like = likes.find_by(post_id: post_id)
  #   like.destroy if like
  # end
  
  # def likes? #likeしているかどうか判定
  #   self.like_posts.include?(post)
  # end

end
