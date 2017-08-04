require "rails_helper"

RSpec.feature "user edits wishlist" do
  scenario "successfully" do
    user = create(:user)
    wishlist = create(:wishlist, user: user)
    new_instrument = "ukelele"

    visit edit_wishlist_path(wishlist, as: user)
    fill_in "Artist", with: wishlist.artist
    fill_in "Title", with: wishlist.title
    fill_in "Instrument", with: new_instrument
    click_button "Update Wishlist"

    expect(page).to have_text "Instrument: #{new_instrument}"
    expect(page).to have_text "Wishlist item updated successfully."
  end
end
