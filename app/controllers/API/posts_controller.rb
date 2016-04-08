class Api::PostsController < ApplicationController
  # respond_to :json                                      # For Responder gem
  def index
    # @posts = Post.all                                   # in controllers
    render json: @posts
  end

  def show
    # @post = Post.find(param[:id])                       # in controllers
    render json: @post
  end

  def new
    # @post = Post.new                                    # in controllers
    render json: @post = Post.new
  end

  def create
    # @post = Post.new                                    # in controllers
    @post.body = params[:post][:body]
    @post.save
    render json: @post = Post.new(post = params[:post][:body])
  end

  def edit
    # @post = Post.find(param[:id])                       # in controllers
    render json: @post
  end

  def update
    # @post = Post.find(param[:id])                       # in controllers
    @post.update(post_params)
    rescue ActiveRecord::RecordNotFound
       render json: { message: "Not Found", status: 404}, status: 404
  end

  def destroy
    # @post = Post.find(param[:id])                       # in controllers
    # @post.destroy                                       # in controllers
    @post.destroy
    render json: @post.destroy
    rescue ActiveRecord::RecordNotFound
       render json: { message: "Not Found", status: 404}, status: 404
  end

private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:user).permit(:username)
  end

end
