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
      user = User.new(user_params)
      if params[:password] == params[:password_confirmation]
      user.password = params[:password]

      if user.save
        jwt = Auth.issue({user: user.id})
        render json: {jwt: jwt}
      else
        render json: {:errors=>
         [{:detail=>"incorrect email or password",
           :source=>{:pointer=>"user/err_type"}}
         ]}, status: 404
      end

    else
      render json: {:errors=>
       [{:detail=>"incorrect email or password",
         :source=>{:pointer=>"user/err_type"}}
       ]}, status: 404
    end
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
