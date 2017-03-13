class SessionsController < ApplicationController

  def new
    if logged_in?
      redirect_to dashboard_path
    else
      @user = User.new
      redirect_to dashboard_path
    end
  end

  def create
    if @user && @user.authenticate(params[:password])
      session[:current_user_id] = @user.id
      redirect_to dashboard_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to signup_path
  end

end
