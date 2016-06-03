class Api::PostsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    render json: @post
  end

    @post = Post.find(params[:id])
  end

  def create
    @post.body = params[:post][:body]
    @post = Post.new(post_params)
    @post.save
    render json: @post = Post.new(post = params[:post][:body])
  end

    render json: @post
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    rescue ActiveRecord::RecordNotFound
       render json: { message: "Not Found", status: 404}, status: 404
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    render json: @post.destroy
    rescue ActiveRecord::RecordNotFound
       render json: { message: "Not Found", status: 404}, status: 404
  end

private

  def post_params
    params.require(:post).permit(:body, :user_id)
  end

end
