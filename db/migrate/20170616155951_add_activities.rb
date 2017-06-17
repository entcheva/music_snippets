class AddActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :info
      t.integer :user_id
      t.integer :subject_id
      t.string :subject_type
    end
  end
end
