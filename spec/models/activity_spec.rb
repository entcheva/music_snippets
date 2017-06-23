require "rails_helper"

RSpec.describe Activity do
  describe "associations" do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :subject }
  end

  describe "is enum" do
    it { should define_enum_for(:status) }
  end
end
