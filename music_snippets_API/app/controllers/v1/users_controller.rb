class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
  end

  def create
    @user = User.new(user_params)
    @user.save
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password_digest)
  end

end
