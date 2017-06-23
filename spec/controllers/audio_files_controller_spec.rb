require "rails_helper"

RSpec.describe AudioFilesController do
  describe "POST #create" do
    it "creates a new activity" do
      allow(Activity).to receive(:create!)

      user = FactoryGirl.create(:user)
      mock_audio_file = stub_relation(user, :audio_files)

      sign_in_as(user)
      post(
        :create,
        params: {
          audio_file: {
            artist: "Beach House",
            title: "Lazuli",
            audio: "#{Rails.root}/spec/support/fixtures/test.mp3",
          },
        },
      )

      expect(Activity).to have_received(:create!).with(
        subject: mock_audio_file,
        user: user,
        status: "created",
      )
    end
  end
end
