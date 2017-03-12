class DashboardsController < ApplicationController

  def index
  end

  def show
    binding.pry
    @user = User.username
    @my_snippets = get_my_snippets_SQL
  end



  private

  def get_my_snippets_SQL
    query = <<-SQL
    SELECT *
    FROM snippets
    INNER JOIN dashboard
    ON snippets.user_id = dashboard.user_id
    SQL
    result = ActiveRecord::Base.connection.execute(query)
  end

end
