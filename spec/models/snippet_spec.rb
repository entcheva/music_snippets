require "rails_helper"

RSpec.describe Snippet do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "snippet is valid" do
    it "snippet has a name" do
      snippet = double(:snippet, name: "Lazuli", artist: "Beach House", notes: ["C", "E", "D", "G"], user_id: 1)

      expect(snippet.name).to eq "Lazuli"
    end

    it "snippet has an artist" do
      snippet = double(:snippet, name: "Hey Jude", artist: "The Beatles", notes: ["Bm", "D", "G", "Em"], user_id: 2)

      expect(snippet.artist).to eq "The Beatles"
    end

    it "snippet has notes" do
      snippet = double(:snippet, notes: ["Bm", "D", "G", "Em"])

      expect(snippet.notes).to eq ["Bm", "D", "G", "Em"]
    end
  end

end
