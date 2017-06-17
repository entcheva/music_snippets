class AudioFilesController < ApplicationController
  def new
    @audio_file = AudioFile.new
  end

  def create
    @audio_file = current_user.audio_files.new(audio_file_params)
    if @audio_file.save
      record_activity(subject: @audio_file)
      redirect_to dashboard_url, notice: "Audio file created! You rock."
    else
      render :new, status: 400
    end
  end

  def edit
    @audio_file = current_user.audio_files.find(params[:id])
  end

  def update
    @audio_file = current_user.audio_files.find(params[:id])
    if @audio_file.update(audio_file_params)
      record_activity(subject: @audio_file)
      redirect_to dashboard_url, notice: "Audio file updated successfully."
    else
      render :edit, status: 400
    end
  end

  private

  def audio_file_params
    params.require(:audio_file).permit(:artist, :title, :audio)
  end
end
