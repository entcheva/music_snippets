class AddForeignKeyToActivities < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :activities, :users
  end
end
