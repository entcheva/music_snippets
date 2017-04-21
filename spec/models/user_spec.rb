require "rails_helper"
require "spec_helper"

RSpec.describe User do
  describe "associations" do
    it { is_expected.to have_many(:snippets) }
    it { is_expected.to have_one(:dashboard) }
  end

  describe "has secure password" do
    user = FactoryGirl.build_stubbed(:user)

    it { is_expected.to have_secure_password }
  end

  describe "is valid" do
    it "has a username" do
      user = FactoryGirl.build_stubbed(:user)


      expect(user.username).to eq "stardude440"
    end

    it "has an email" do
      user = FactoryGirl.build_stubbed(:user)

      expect(user.email).to eq "stardude440@gmail.com"
    end
  end
end
