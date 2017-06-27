require "rails_helper"

RSpec.describe DashboardsController do
  describe "#show" do
    it "creates a new SuggestionsJobStatus" do
      user = FactoryGirl.create(:user)
      sign_in_as(user)
      p_job_id = double(GetSuggestionsJob, provider_job_id: "67dfd3-5ksTd-d543")
      allow(GetSuggestionsJob).to receive(:perform_later).and_return(p_job_id)

      get :show

      expect(response).to have_http_status(200)
      expect(SuggestionsJobStatus.last.jobid).to eq "67dfd3-5ksTd-d543"
    end
  end
end
