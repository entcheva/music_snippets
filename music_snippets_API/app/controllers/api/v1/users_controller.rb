module Api::V1

  class UsersController < ApplicationController

    def index
      @users = User.all
      render json: @users, each_serializer: UserSerializer
    end

    def new
      find_user
      render json: @user
    end

    def create
      @user = User.create(user_params)

      # if params[:password] === params[:password_confirmation]
      #   @user.password = params[:password]
      #   @user.save
      #   render json: {jwt: jwt}
      # else
      #   render json: {:errors=> [{:detail=>"failed password verification", :source=>{:pointer=>"user/err_type"}} ] }, status: 404
      # end

    end

    def edit
      find_user
    end

    def update
      find_user
      @user = User.update(user_params)
    end

    def delete
      find_user
    end

    def destroy
      @user.destroy
      @users = User.all
      render json: @users
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
