require "rails_helper"

RSpec.describe SnippetsController do
  describe "POST #create" do
    it "creates a new activity" do
      allow(Activity).to receive(:create!)

      user = create(:user)
      mock_snippet = stub_relation(user, :snippets)

      sign_in_as(user)
      post(
        :create,
        params: {
          snippet: {
            artist: "Beach House",
            title: "Lazuli",
            notes: "A, B, C, D",
          },
        },
      )

      expect(Activity).to have_received(:create!).with(
        subject: mock_snippet,
        user: user,
        status: "created",
      )
    end
  end
end
