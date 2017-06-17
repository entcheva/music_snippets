class RemoveSubjectFromActivities < ActiveRecord::Migration[5.0]
  def change
    remove_column :activities, :subject, :string
  end
end
