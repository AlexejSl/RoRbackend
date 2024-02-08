class Post < ApplicationRecord
  belongs_to :user, foreign_key: :username, primary_key: :username
  has_many :comments, dependent: :destroy
end
