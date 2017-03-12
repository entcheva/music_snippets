class UsersController < ApplicationController

    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.valid?
        @user.save
        # session[:user_id] = @user.id
        redirect_to @user
      else
        flash[:notice] = "Passwords don't match, please try again."
        redirect_to :new_user
      end
    end

    def show
      find_user
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
      @user.destroy
      @users = User.all
    end

    def destroy
    end

    def active_user
      username = active_user.username
    end

    def active_user_id
      user_id = active_user.id
    end

    private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

    def find_user
      @user = User.find(params[:id])
    end

  end
