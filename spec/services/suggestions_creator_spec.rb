require "rails_helper"
require "json-schema"
require "json_matchers/rspec"

RSpec.describe SuggestionsCreator do
  describe "#get_tracks" do
    it "returns a track from Spotify API" do
      track_example = File.read(
        Rails.root.join(
          "spec", "support", "api", "schemas", "spotify", "track-example.json")
      )

      spotify_token = {
        "access_token" => "BQDgqk2108QWdiluKnJ_QvUYXfykcaeBlTSad4RqEFqAnx1X_6Q",
        "token_type" => "Bearer",
        "expires_in" => 3600,
      }
      allow(RestClient).to receive(:get).and_return(track_example)

      track = SuggestionsCreator.new(spotify_token)
      result = track.get_tracks

      expect(RestClient).to have_received(:get)
      expect(result).to include(album: "Hot Fuss (Deluxe Version)")
      expect(result).to include(artist: "The Killers")
      expect(result).to include(
        image: "https://i.scdn.co/image/d0186ad64df7d6fc5f65c20c7d16f4279ffeb815",
      )
      expect(result).to include(title: "Mr. Brightside")
    end

    it "returns the correct JSON schema for a simple track" do
      track_example = File.read(
        Rails.root.join(
          "spec", "support", "api", "schemas", "spotify", "track-example.json"
        )
      )
      track_schema = File.read(
        Rails.root.join(
          "spec", "support", "api", "schemas", "track-simple.json"
        )
      )

      spotify_token = {
        "access_token" => "BQDgqk2108QWdiluKnJ_QvUYXfykcaeBlTSad4RqEFqAnx1X_6Q",
        "token_type" => "Bearer",
        "expires_in" => 3600,
      }
      allow(RestClient).to receive(:get).and_return(track_example)

      track = SuggestionsCreator.new(token: spotify_token)
      result = track.get_tracks

      expect(result).to match_response_schema("track-simple")
      JSON::Validator.fully_validate(track_schema, track_example)
    end
  end
end
