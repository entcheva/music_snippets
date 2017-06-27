require "rails_helper"

RSpec.describe SuggestionsJobStatusesController do
  describe "#show" do
    it "renders a job status successfully" do
      user = FactoryGirl.create(:user)
      sign_in_as(user)
      payload = {
        album: "The Soft Moon",
        image: "https://i.scdn.co/image/f68af6b83fc23b0ce82526e17835b92e57345581",
        title: "Breathe The Fire",
        artist: "The Soft Moon",
      }
      job_status = SuggestionsJobStatus.create!(
        id: 90,
        message: "success",
        payload: payload,
        done: true,
        jobid: "ecd58ee2-4eb8-42bb-80d1-3decd911e3ac",
      )

      get :show, params: { id: job_status }

      expect(response).to have_http_status(201)
      expect(response.body).to have_text("The Soft Moon")
      expect(response.body).to have_text("Breathe The Fire")
    end
  end
end
