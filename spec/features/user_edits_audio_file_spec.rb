require "rails_helper"

RSpec.feature "user edits audio file" do
  scenario "successfully" do
    user = create(:user)
    audio_file = create(:audio_file, user: user)
    new_file = "#{Rails.root}/spec/support/fixtures/test.aif"

    visit edit_audio_file_path(audio_file, as: user)
    fill_in "Artist", with: audio_file.artist
    fill_in "Title", with: audio_file.title
    attach_file(
      "Audio",
      new_file,
    )
    click_button "Update Audio file"

    expect(page).to have_text "test.aif"
    expect(page).to have_text "Audio file updated successfully."
  end

  scenario "only if they have created it" do
    user = create(:user)
    other_user = create(:user)
    audio_file = create(:audio_file, user: user)

    visit edit_audio_file_path(audio_file, as: user)

    expect(page).to have_text "Update your audio file:"

    expect {
      visit edit_audio_file_path(audio_file, as: other_user)
    }.to raise_exception(ActiveRecord::RecordNotFound)
  end
end
