class AddStatusToActivities < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :status, :integer, default: 0, null: false
  end
end
