class PostsController < ApplicationController

  def index
    @posts = Post.all
    # render json: @posts                                         #Done right # From API
  end

  def show
    @post = Post.find(param[:id])
    # render json: @post                                          #Done right # From API
  end

  def new
    @post = Post.new
    # render json: @post = Post.new                                # From API # from responder gem
  end

  def create
    @post = Post.new
    # @post.body = params[:post][:body]                            # From API
    # @post.save                                                   # From API
    # render json: @post = Post.new(post = params[:post][:body])   # From API # from responder gem
  end

  def edit
    @post = Post.find(param[:id])
    # render json: @post                                           # From API # from responder gem
  end

  def update
    @post = Post.find(param[:id])
    # @post.update(post_params)                                    # From API
    # rescue ActiveRecord::RecordNotFound                          # From API
      #  render json: { message: "Not Found", status: 404}, status: 404 # From API
  end

  def destroy
    @post = Post.find(param[:id])
    @post.destroy
    # @post.destroy                                                 # From API
    # render json: @post.destroy                                    # From API # from responder gem
    # rescue ActiveRecord::RecordNotFound                           # From API
      #  render json: { message: "Not Found", status: 404}, status: 404 # From API
  end

private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:user).permit(:username)
  end

end
