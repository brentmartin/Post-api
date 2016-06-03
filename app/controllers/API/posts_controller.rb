class Api::PostsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    render json: @post.to_json(include: :user)
  end

  def create
    @post = Post.new(post_params)
    @post.save
    render json: @post
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    render json: @post
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    render json: @post.destroy
  end

private

  def post_params
    params.require(:post).permit(:body, :user_id)
  end

end
