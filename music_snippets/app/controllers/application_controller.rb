class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def find_user
    @user = User.find(session[:user_id]) if session[:user_id]
    @user ||= User.new
  end

end
