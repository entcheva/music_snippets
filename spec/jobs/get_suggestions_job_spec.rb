require "rails_helper"

RSpec.describe GetSuggestionsJob, type: :job do
  include ActiveJob::TestHelper
  Rails.application.config.active_job.queue_adapter = :test

  describe "#perform" do
    it "returns success message when successful" do
      token = double(SpotifyAuthenticator)
      allow(SpotifyAuthenticator).to receive(:new).and_return(token)
      allow(token).to receive(:authenticate).and_return(foo: "bar")

      tracks = double(SuggestionsCreator, token: {})
      allow(SuggestionsCreator).to receive(:new).and_return(tracks)
      allow(tracks).to receive(:get_tracks).and_return(foo: "bar")

      job_status = SuggestionsJobStatus.create!
      GetSuggestionsJob.perform_now(job_status)

      expect(token).to have_received(:authenticate).once
      expect(tracks).to have_received(:get_tracks).once
      expect(job_status.message).to eq I18n.t(
        "spotify.suggestions.message.success",
      )
    end

    it "returns failure message when NOT successful" do
      token = double(SpotifyAuthenticator)
      allow(SpotifyAuthenticator).to receive(:new).and_return(token)
      allow(token).to receive(:authenticate).and_return({})

      tracks = double(SuggestionsCreator, token: {})
      allow(SuggestionsCreator).to receive(:new).and_return(tracks)
      allow(tracks).to receive(:get_tracks).and_return({})

      job_status = SuggestionsJobStatus.create!
      GetSuggestionsJob.perform_now(job_status)

      expect(token).to have_received(:authenticate).once
      expect(tracks).to have_received(:get_tracks).once
      expect(job_status.message).to eq I18n.t(
        "spotify.suggestions.message.failure",
      )
    end
  end

  describe "#perform_later" do
    it "adds the job to the queue" do
      job_status = SuggestionsJobStatus.create!
      GetSuggestionsJob.perform_later(job_status)

      assert_enqueued_jobs 1
      expect(enqueued_jobs.last[:job]).to eq described_class
    end
  end
end
