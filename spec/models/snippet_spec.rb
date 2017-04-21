require "rails_helper"

RSpec.describe Snippet do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "is valid" do
    it "has a name" do
      snippet = FactoryGirl.build_stubbed(:snippet)

      expect(snippet.name).to eq "Lazuli"
    end

    it "has an artist" do
      snippet = FactoryGirl.build_stubbed(:snippet)

      expect(snippet.artist).to eq "Beach House"
    end

    it "has notes" do
      snippet = FactoryGirl.build_stubbed(:snippet)

      expect(snippet.notes).to eq "A, D, C, G"
    end

    it "has a user_id" do
      user = FactoryGirl.build_stubbed(:user)
      snippet = FactoryGirl.build_stubbed(:snippet) 
      snippet.user_id = user.id

      expect(snippet.user_id).to eq 2
    end
  end
end
