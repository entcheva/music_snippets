class DashboardsController < ApplicationController
  def index
    @user = current_user
  end

  def show
    @activities = current_user.activities.order("created_at DESC")
  end
end
