class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
                    
  has_secure_password #bycriptと合わせて暗号化
  
  has_many :posts
  
  has_many :likes
  
  has_many :like_posts, through: :likes, source: :post
  #throughでlikesテーブルを通じてpost_idを取得する。
  
  def like(post) 
    likes.find_or_create_by(post_id: post_id)
  end
  
  def unlike(post) 
    like = likes.find_by(post_id: post_id)
    like.destroy if like
  end
  
  def likes?(post) #likeしているかどうか判定
    self.like_posts.include?(post)
  end
end
