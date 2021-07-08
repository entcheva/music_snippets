require "rails_helper"

RSpec.feature "User edits snippet" do
  scenario "successfully" do
    user = create(:user)
    snippet = create(:snippet, user: user)
    new_artist = "The Beatles"

    visit edit_snippet_path(snippet, as: user)

    fill_in "Artist", with: new_artist
    fill_in "Title", with: snippet.title
    fill_in "Notes", with: snippet.notes
    click_button "Update Snippet"

    expect(page).to have_content "#{snippet.title}, by #{new_artist}"
    expect(page).to have_text "Snippet updated successfully."
  end

  scenario "unsuccessfully" do
    user = create(:user)
    snippet = create(:snippet, user: user)

    visit edit_snippet_path(snippet, as: user)

    expect(page).to have_text "Update your music snippet"
    expect(snippet.artist).to eq("Beach House")
    expect(page).to have_button "Update Snippet"

    fill_in "Artist", with: ""
    fill_in "Title", with: snippet.title
    fill_in "Notes", with: snippet.notes
    click_button "Update Snippet"

    expect(page).to have_content "can't be blank"
  end

  scenario "only if they have created it" do
    user = create(:user)
    other_user = create(:user)
    snippet = create(:snippet, user: user)

    visit edit_snippet_path(snippet, as: user)

    expect(page).to have_text "Update your music snippet"

    expect {
      visit edit_snippet_path(snippet, as: other_user)
    }.to raise_exception(ActiveRecord::RecordNotFound)
  end
end
