class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def most_posts
    @users = User.order(posts_count: :desc).limit(3)
    render json: @users, only: [:username, :posts_count]
  end

  def most_engaged
    @users = User.joins(:posts)
                 .group(:id)
                 .order('AVG(posts.comments_count) DESC')
                 .limit(3)
    render json: @users, only: [:username], methods: :average_comments
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end