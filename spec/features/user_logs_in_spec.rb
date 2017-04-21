require "rails_helper"

RSpec.describe "User authentication" do
  scenario "logs in" do
    user = FactoryGirl.create(:user)

    visit login_path
    within "form" do
      fill_in "username", with: user.username
      fill_in "password", with: "password"
      click_on "Log In"
    end

    expect(page).to have_text "Hi,"
  end
end
