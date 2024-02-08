class User < ApplicationRecord
  has_many :posts, ->(user) { where(username: user.username) }, foreign_key: :username, primary_key: :username

  def filtered_posts
    posts
  end
end