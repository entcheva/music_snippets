require "rails_helper"

RSpec.feature "user views suggestions" do
  scenario "successfully" do
    user = FactoryGirl.create(:user)

    visit dashboard_path(as: user)

    expect(page).to have_text "hi suggestion"
  end
end
