require "rails_helper"

RSpec.describe User do
  describe "associations" do
    it { is_expected.to have_many(:snippets) }
    it { is_expected.to have_one(:dashboard) }
  end

  describe "has secure password" do
    user = User.create(username: "spacedude440", email: "spacedude440@gmail.com")

    it { is_expected.to have_secure_password }
  end

  describe "is valid" do
    it "has a username" do
      user = User.create(username: "spacedude440", email: "spacedude440@gmail.com")

      expect(user.username).to eq "spacedude440"
    end

    it "has an email" do
      user = User.create(username: "spacedude440", email: "spacedude440@gmail.com")

      expect(user.email).to eq "spacedude440@gmail.com"
    end
  end
end
