class DashboardsController < ApplicationController

  def index
  end

  def show
    @all_snippets = get_all_snippets_SQL
  end

  private

  def current_user
    @current_user = User.find_by_id(session[:current_user_id])
  end

  def get_all_snippets_SQL
    query = <<-SQL
    SELECT *
    FROM snippets
    -- INNER JOIN dashboard
    -- ON snippets.user_id = dashboard.user_id
    SQL
    result = ActiveRecord::Base.connection.execute(query)
  end

end
