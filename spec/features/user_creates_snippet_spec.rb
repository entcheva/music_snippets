require "rails_helper"

RSpec.feature "User creates snippet" do
  scenario "successfully" do
    user = FactoryGirl.create(:user)
    name = "Song title"
    artist = "Artist name"
    notes = "A, D, C, G"

    visit new_snippet_path(as: user)
    fill_in "Name", with: name
    fill_in "Artist", with: artist
    fill_in "Notes", with: "A, D, C, G"
    click_button "Create Snippet"

    expect(page).to have_text "#{name}, by #{artist}"
    expect(page).to have_text notes
    expect(page).to have_text "Saved by: #{user.username}"
  end

  scenario "unsuccessfully" do
    user = FactoryGirl.create(:user)

    visit new_snippet_path(as: user)
    click_button "Create Snippet"

    expect(page).to have_text "can't be blank"
  end
end
