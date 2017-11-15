class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    user = User.new(email: params[:email], password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors }, status: :unprocessable_entity
    end

  end

  def destroy
    if @user.destroy
      render json: @user, status: :ok
    else
      render json: { errors: 'Something went wrong' }
    end
  end

  private

    def set_user
      @user ||= User.find_by(id: params[:id])
    end
end
