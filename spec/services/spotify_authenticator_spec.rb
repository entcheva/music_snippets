require "rails_helper"

RSpec.describe SpotifyAuthenticator do
  describe "#authenticate" do
    it "returns access token from Spotify API" do
      post_response = double(
        :post_response,
        body: %q({
          "access_token":"BQDgqk2108QWdiluKnJ_QvUddeupO2hH4vOXJpfxnE4GSOd4jFIM",
          "token_type":"Bearer",
          "expires_in":3600
        })
      )
      allow(RestClient).to receive(:post).and_return(post_response)

      authenticator = SpotifyAuthenticator.new
      result = authenticator.authenticate

      expect(RestClient).to have_received(:post)
      expect(result).to include(
        "access_token" => "BQDgqk2108QWdiluKnJ_QvUddeupO2hH4vOXJpfxnE4GSOd4jFIM",
      )
      expect(result).to include("token_type" => "Bearer")
    end
  end
end
