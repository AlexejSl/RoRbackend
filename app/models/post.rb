class Post < ApplicationRecord
  belongs_to :user, foreign_key: :username, primary_key: :username, counter_cache: true
  validates :username, presence: true
  validates :title, presence: true
  validates :text, presence: true
  has_many :comments, dependent: :destroy, counter_cache: true

  
  #I dont know why but even when i had set the default to 0 in migration it was null for new post with no comments, so thats why i use this after_initialize middleware
  after_initialize :set_default_comments_count, if: :new_record?

  private

  def set_default_comments_count
    self.comments_count ||= 0
  end

end
