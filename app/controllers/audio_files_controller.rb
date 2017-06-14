class AudioFilesController < ApplicationController
  def new
    @audio_file = AudioFile.new
  end

  def create
    @audio_file = current_user.audio_files.new(audio_file_params)
    if @audio_file.save
      redirect_to dashboard_url, notice: "Audio file saved successfully"
    else
      render :new
    end
  end

  private

  def audio_file_params
    params.require(:audio_file).permit(:artist, :title, :audio)
  end
end
