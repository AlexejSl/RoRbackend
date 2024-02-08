class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [:index_by_user]

  def index
    @posts = Post.all
    render json: @posts
  end

  def index_by_user
    @posts = @user.posts
    render json: @posts
  end

  def create
    @user = User.find_or_create_by(username: post_params[:username])
    @post = @user.posts.build(post_params)

    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Post not found' }, status: :not_found
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    head :no_content
  end

  private

  def set_user
    @user = User.find_by(username: params[:username])
    render json: { error: 'User not found' }, status: :not_found unless @user
  end

  def post_params
    params.require(:post).permit(:username, :title, :text) 
  end
end