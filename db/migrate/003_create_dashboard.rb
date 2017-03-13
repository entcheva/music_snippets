class CreateDashboard < ActiveRecord::Migration

  def change
    create_table :dashboard do |t|
      t.integer :user_id
    end
  end

end
