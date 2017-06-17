class AddIndicesToActivities < ActiveRecord::Migration[5.0]
  def change
    add_index :activities, :subject_id
    add_index :activities, :subject_type
    add_index :activities, :user_id
  end
end
