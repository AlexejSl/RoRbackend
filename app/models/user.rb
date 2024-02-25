class User < ApplicationRecord
  has_many :posts, foreign_key: :username, primary_key: :username
  validates_associated :posts

  def average_comments
    posts.average(:comments_count).to_f || 0
  end

  def filtered_posts
    posts.where(username: username)
  end
end