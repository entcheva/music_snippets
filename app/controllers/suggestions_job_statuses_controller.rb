class SuggestionsJobStatusesController < ApplicationController
  def show
    job_status = SuggestionsJobStatus.find(params[:id])
    if !job_status.done?
      render json: {}, status: 202
    elsif job_status.done?
      render json: job_status, status: 201
    else
      render json: {}, status: 422
    end
  end
end
