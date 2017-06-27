class GetSuggestionsJob < ApplicationJob
  queue_as :default

  def perform(job_status)
    jobid = job_status.jobid
    @spotify_tracks = SuggestionsCreator.new(authenticate)

    if tracks.present?
      job_status.update(job_attributes_success(jobid))
    else
      job_status.update(job_attributes_failure(jobid))
    end
  end

  private

  def authenticate
    token = SpotifyAuthenticator.new
    _token ||= token.authenticate
  end

  def tracks
    @_tracks ||= @spotify_tracks.get_tracks
  end

  def job_attributes_success(jobid)
    {
      message: I18n.t("spotify.suggestions.message.success"),
      jobid: jobid,
      payload: tracks,
      done: true,
    }
  end

  def job_attributes_failure(jobid)
    {
      message: I18n.t("spotify.suggestions.message.failure"),
      jobid: jobid,
      payload: {},
      done: true,
    }
  end
end
