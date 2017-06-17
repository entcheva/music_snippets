class AddSubjectToActivities < ActiveRecord::Migration[5.0]
  def up
    add_column :activities, :subject, :string
    remove_column :activities, :info, :string
  end

  def down
    remove_column :activities, :subject, :string
    add_column :activities, :info, :string
  end
end
