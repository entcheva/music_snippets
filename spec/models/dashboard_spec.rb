require "rails_helper"

RSpec.describe Dashboard do
  describe "associations" do
    it { is_expected.to belong_to :user }
  end
end
