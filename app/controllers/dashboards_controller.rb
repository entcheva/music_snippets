class DashboardsController < ApplicationController
  def index
    @user = current_user
  end

  def show
    @job_status = SuggestionsJobStatus.create!
    job = GetSuggestionsJob.perform_later(@job_status)
    @job_status.update!(jobid: job.provider_job_id)

    @activities = current_user.activities.order("created_at DESC")
  end
end
