class User < ApplicationRecord
  has_many :posts, ->(user) { where(username: user.username) }, foreign_key: :username, primary_key: :username

  validates_associated :posts #i dont know if this works to be honest was trying to debug why users are added when post is rolled back, but fixed it in controller

  def filtered_posts
    posts
  end
end