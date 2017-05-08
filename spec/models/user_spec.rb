require "rails_helper"
require "spec_helper"

RSpec.describe User do
  describe "associations" do
    it { is_expected.to have_many(:snippets) }
    it { is_expected.to have_one(:dashboard) }
  end

  describe "is valid" do
    it "has a unique username" do
      validate_uniqueness_of(:username)
    end

    it "has a unique email" do
      validate_uniqueness_of(:email)
    end
  end
end
