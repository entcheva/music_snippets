require "rails_helper"

RSpec.feature "user views suggestions", :js do
  scenario "successfully" do
    user = create(:user)
    activities = create_pair(:activity, user: user)

    token = double(SpotifyAuthenticator)
    allow(SpotifyAuthenticator).to receive(:new).and_return(token)
    allow(token).to receive(:authenticate).and_return(token)

    track = {
      "image": "https://i.scdn.co/image/d0186ad64df7d6fc5f65c20c7d16f4279ffeb815",
      "title": "Song Title",
      "artist": "The Killers",
      "album": "Hot Fuss",
    }
    tracks = double(SuggestionsCreator, token: token)
    allow(SuggestionsCreator).to receive(:new).and_return(tracks)
    allow(tracks).to receive(:get_tracks).and_return(track)

    visit dashboard_path(as: user)

    expect(page).to have_text "The Killers"
    expect(page).to have_text "Hot Fuss"
    expect(page).to have_content(activities.first.subject_type)
    expect(page).to have_content(activities.last.subject_type)
    expect(page).to have_content I18n.t("spotify.suggestions.message.success")
  end
end
