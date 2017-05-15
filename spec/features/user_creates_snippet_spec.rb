require "rails_helper"
require "spec_helper"

RSpec.feature "User creates snippet" do
  scenario "successfully" do
    user = FactoryGirl.create(:user)
    sign_up_with(user)

    visit new_snippet_path(as: user)
    within "form" do
      fill_in "Name", with: "Song title"
      fill_in "Artist", with: "Artist name"
      fill_in "Notes", with: "A, D, C, G"
      click_button "Create Snippet"
    end

    expect(page).to have_text "Song title"
    expect(page).to have_text "Artist name"
    expect(page).to have_text "A, D, C, G"
    expect(page).to have text "Saved by: #{user.username}"
  end

  scenario "unsuccessfully" do
  end

  def sign_up_with(user)
    visit sign_up_path
    fill_in "Email", with: user.email
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Sign up"
  end
end
