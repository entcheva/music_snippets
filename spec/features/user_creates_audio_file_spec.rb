require "rails_helper"

RSpec.feature "User creates audio file" do
  scenario "successfully" do
    user = FactoryGirl.create(:user)
    artist = "Artist name"
    title = "Song title"

    visit new_audio_file_path(as: user)
    fill_in "Artist", with: artist
    fill_in "Title", with: title
    attach_file(
      "Audio",
      "#{Rails.root}/spec/support/fixtures/test.mp3",
    )
    click_button "Create Audio file"

    expect(page).to have_content "Audio file created! You rock."
  end
end
