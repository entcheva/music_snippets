require "rails_helper"

RSpec.describe AudioFiles do
  describe "associations" do
    it { is_expected.to belong_to :user }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :artist }
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :audio }
  end
end
