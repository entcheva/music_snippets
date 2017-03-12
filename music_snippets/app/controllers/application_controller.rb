class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  private

  def current_user
    @current_user = User.find_by_id(session[:current_user_id])
  end

  def logged_in?
    current_user != nil
  end


end