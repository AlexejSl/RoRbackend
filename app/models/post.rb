class Post < ApplicationRecord
  belongs_to :user, foreign_key: :username, primary_key: :username
  validates :username, presence: true
  validates :title, presence: true
  validates :text, presence: true
  has_many :comments, dependent: :destroy
end
