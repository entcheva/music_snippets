class UsersController < ApplicationController

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.valid?
        @user.save
        session[:user_id] = @user.id
        redirect_to dashboard_path
      else
        flash[:notice] = "Passwords don't match, please try again."
        redirect_to signup_path
      end
    end

    def show
      find_user
    end

    # def edit
    #   find_user
    # end
    #
    # def update
    #   find_user
    #   @user = User.update(user_params)
    # end
    #
    # def delete
    #   find_user
    #   @user.destroy
    #   @users = User.all
    # end
    #
    # def destroy
    # end

    private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

    # def find_user
    #   @user = User.find(params[:id])
    # end

  end
