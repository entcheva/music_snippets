require "rails_helper"

RSpec.feature "User creates snippet" do
  scenario "successfully" do
    user = FactoryGirl.create(:user)
    artist = "Artist name"
    title = "Song title"
    notes = "A, D, C, G"

    visit new_snippet_path(as: user)
    fill_in "Artist", with: artist
    fill_in "Title", with: title
    fill_in "Notes", with: "A, D, C, G"
    click_button "Create Snippet"

    expect(page).to have_text "#{title}, by #{artist}"
    expect(page).to have_text notes
    expect(page).to have_text "saved by: #{user.username}"
  end
end
