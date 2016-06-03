class Api::UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user.to_json(include: :posts)
  end

  def create
    render json: @user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    render json: @user
    rescue ActiveRecord::RecordNotFound
      render json: { message: "Not Found", status: 404}, status: 404
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: @user.destroy
    rescue ActiveRecord::RecordNotFound
      render json: { message: "Not Found", status: 404}, status: 404
  end

private

  def user_params
    params.require(:user).permit(:name)
  end

end
