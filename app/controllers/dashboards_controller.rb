class DashboardsController < ApplicationController

  def index
  end

  def show
    @all_snippets = Dashboard.get_all_snippets_SQL
    # binding.pry
  end

end
