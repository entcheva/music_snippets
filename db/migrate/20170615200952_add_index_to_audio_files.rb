class AddIndexToAudioFiles < ActiveRecord::Migration[5.0]
  def change
    add_index :audio_files, :user_id
  end
end
