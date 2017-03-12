class UsersController < ApplicationController

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.valid?
        @user.save
        session[:current_user_id] = @user.id
      redirect_to dashboard_path
      else
        flash[:notice] = "Invalid username or password."
        redirect_to login_path
      end
    end

    def show
      @user = User.find(params[:id])
    end

    private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

  end
