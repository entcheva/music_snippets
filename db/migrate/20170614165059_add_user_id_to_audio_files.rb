class AddUserIdToAudioFiles < ActiveRecord::Migration[5.0]
  def change
    add_column :audio_files, :user_id, :integer
  end
end
