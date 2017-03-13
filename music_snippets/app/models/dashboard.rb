class Dashboard < ApplicationRecord
  has_many :snippets
  belongs_to :user

  def self.get_all_snippets_SQL
    query = <<-SQL
    SELECT *
    FROM snippets
    -- INNER JOIN dashboard
    -- ON snippets.user_id = dashboard.user_id
    SQL
    result = ActiveRecord::Base.connection.execute(query)
  end

end
