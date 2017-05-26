require "rails_helper"

RSpec.feature "User edits snippet" do
  scenario "successfully" do
    user = FactoryGirl.create(:user)
    snippet = FactoryGirl.create(:snippet, user: user)

    visit edit_snippet_path(as: user)

    expect(page).to have_text "Edit Snippet"
  end

  scenario "unsuccessfully" do
  end
end
