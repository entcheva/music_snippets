require "rails_helper"

RSpec.feature "user views activity feed" do
  scenario "successfully" do
    user = FactoryGirl.create(:user)
    snippet = FactoryGirl.create(:activity, :snippet_type, user: user)
    audio = FactoryGirl.create(:activity, :audio_file_type, user: user)
    wishlist = FactoryGirl.create(:activity, :wishlist_type, user: user)

    visit dashboard_path(as: user)

    expect(page).to have_content snippet.subject.notes
    expect(page).to have_content audio.subject.audio
    expect(page).to have_text wishlist.subject.instrument
  end
end
