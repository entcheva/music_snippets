class AddForeignKeyToAudioFiles < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :audio_files, :users
  end
end
