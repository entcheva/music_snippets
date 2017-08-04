require "rails_helper"

RSpec.feature "user views activity feed" do
  scenario "successfully" do
    user = create(:user)
    snippet = create(:activity, :snippet_type, user: user)
    audio = create(:activity, :audio_file_type, user: user)
    wishlist = create(:activity, :wishlist_type, user: user)

    visit dashboard_path(as: user)

    expect(page).to have_content snippet.subject.notes
    expect(page).to have_content audio.subject.audio
    expect(page).to have_text wishlist.subject.instrument
  end
end
