require "rails_helper"

RSpec.describe Wishlist do
  describe "associations" do
    it { is_expected.to belong_to :user }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :artist }
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :instrument }
  end
end
