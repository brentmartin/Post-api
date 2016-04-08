class Api::UsersController < ApplicationController
  # respond_to :json                                      # For Responder gem
  def index
    # @users = User.all                                 # in controllers
    render json: @users
  end

  def show
    # @user = User.find(params[:id])                    # in controllers
    render json: @user.to_json(include: :posts)
  end

  def new
    # @user = User.new                                    # in controllers
    respond_with @user = User.new
  end

  def create
    # @user = User.new                                    # in controllers
    # @user.save                                          # in controllers
    respond_with @user = User.new(username: params[:user][:username])
  end

  def edit
    # @user = User.find(params[:id])                      # in controllers
    respond_with @user
  end

  def update
    # User.update(params[:id])                            # in controllers
    @user.update(user_params)
    respond_with @user
    rescue ActiveRecord::RecordNotFound
      render json: { message: "Not Found", status: 404}, status: 404
  end

  def destroy
    # @user = User.find(params[:id])                      # in controllers
    @user.destroy
    respond_with @user.destroy
    rescue ActiveRecord::RecordNotFound
      render json: { message: "Not Found", status: 404}, status: 404
  end

private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username)
  end

end
