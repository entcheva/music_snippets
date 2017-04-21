require "rails_helper"

RSpec.describe Snippet do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "is valid" do
    it "has a name" do
      snippet = Snippet.new(name: "Lazuli", artist: "Beach House", notes: "C, E, D, G", user_id: 1)

      expect(snippet.name).to eq "Lazuli"
    end

    it "has an artist" do
      snippet = Snippet.new(name: "Hey Jude", artist: "The Beatles", notes: "Bm, D, G, Em", user_id: 2)

      expect(snippet.artist).to eq "The Beatles"
    end

    it "has notes" do
      snippet = Snippet.new(name: "Hey Jude", artist: "The Beatles", notes: "Bm, D, G, Em" , user_id: 2)

      expect(snippet.notes).to eq "Bm, D, G, Em"
    end

    it "has a user_id" do
      user = User.new(id: 2, username: "spacedude440", email: "spacedude440@gmail.com")
      snippet = Snippet.new(name: "Hey Jude", artist: "The Beatles", notes: "Bm, D, G, Em")
      snippet.user_id = user.id

      expect(snippet.user_id).to eq 2
    end
  end
end
