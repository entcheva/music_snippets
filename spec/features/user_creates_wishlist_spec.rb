require "rails_helper"

RSpec.feature "User creates wishlist" do
  scenario "successfully" do
    user = FactoryGirl.create(:user)
    artist = "Artist name"
    title = "Song title"

    visit new_wishlist_path(as: user)
    fill_in "Artist", with: artist
    fill_in "Title", with: title
    fill_in "Instrument", with: "Piano"
    click_button "Create Wishlist"

    expect(page).to have_content "Wishlist item created! You rock."
  end
end
