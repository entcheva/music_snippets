class CreateAudioFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :audio_files do |t|
      t.string :artist
      t.string :title
      t.attachment :audio
    end
  end
end
