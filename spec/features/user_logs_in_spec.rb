require "rails_helper"

RSpec.describe "User authentication" do
  scenario "logs in" do
    user = FactoryGirl.create(:user)

    visit sign_in_path
    within "form" do
      fill_in "session_email", with: user.email
      fill_in "session_password", with: "password"
      click_on "Sign in"
    end

    expect(page).to have_text "Hi, #{user.username}"
  end
end
