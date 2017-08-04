RSpec.feature "User deletes music snippet" do
  scenario "successfully" do
    user = create(:user)
    snippet = create(:snippet, user: user)

    visit edit_snippet_path(snippet, as: user)
    click_button "Delete"

    expect(page).to have_content("Your snippet has been deleted.")
  end
end
