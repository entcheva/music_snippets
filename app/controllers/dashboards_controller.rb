class DashboardsController < ApplicationController

  def index
    @user = current_user
  end

  def show
    @all_snippets = Snippet.all.reverse
  end

end
