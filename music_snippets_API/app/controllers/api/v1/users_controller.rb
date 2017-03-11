module Api::V1

  class UsersController < ApplicationController

    def index
      @users = User.all
      render json: @users, each_serializer: UserSerializer
    end

    def new
      render json: find_user
    end

    def create
      @user = User.create(user_params)
    end

    def show
      render json: find_user
    end

    def edit
      find_user
    end

    def update
      find_user
      @user = User.update(user_params)
      render json: @user
    end

    def delete
      find_user
      @user.destroy
      @users = User.all
      render json: @users
    end

    def destroy
    end

    private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

    def find_user
      @user = User.find(params[:id])
    end

  end

end
