class UsersController < ApplicationController

  def index
    @users = User.all
    # render json: @users                                             # in API
  end

  def show
    @user = User.find(params[:id])
    # render json: @user.to_json(include: :posts)                     # in API
  end

  def new
    @user = User.new
    # render json: @user = User.new                                     # in API
  end

  def create
    @user = User.new
    @user.save
    # render json: @user = User.new(username: params[:user][:username]) # in API
  end

  def edit
    @user = User.find(params[:id])
    # render json: @user                                                # in API
  end

  def update
    User.update(params[:id])
    # @user.update(user_params)                                         # in API
    # render json: @user                                                # in API
    # rescue ActiveRecord::RecordNotFound                               # in API
    #   render json: { message: "Not Found", status: 404}, status: 404  # in API
  end

  def destroy
    @user = User.find(params[:id])
    # @user.destroy                                                     # in API
    # render json: @user.destroy                                        # in API
    # rescue ActiveRecord::RecordNotFound                               # in API
    #   render json: { message: "Not Found", status: 404}, status: 404  # in API
  end

private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username)
  end

end
