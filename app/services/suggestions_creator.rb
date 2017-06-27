class SuggestionsCreator
  RANDOM_TRACKS = {
    amo_bishop_roden: "1oeovPFdMfedh7VpbXg6YP",
    breathe_the_fire: "7qLDBd5iCh9xilyfdkn9v8",
    chinatown_style: "0KisC636mzjXthrEjmebyZ",
    dark_entries: "3tuaOXGEQ8FigsBxCVs6ym",
    dipped_into_poison: "3rTt87UHznxregyc3chpHD",
    do_it_myself: "5mB1bWU8VueYVxuvcLPn2B",
    dont_fear_the_reaper: "5QTxFnGygVM4jFQiBovmRo",
    egyptian_reggae: "3FtqoENKDN0nq5bWNxHPYR",
    electric_current: "2JCmUdoi8YBXamZRvZD5ms",
    new_rules: "6tF92PMv01Ug9Dh8Rmy6nH",
    psychic_trauma: "6mUWyM02M91VoRGKFeRhjt",
    the_lonely: "5Ph4oc2OswwnwLW5djIJWv",
    whirl: "2sNZg0tXxXDAIzQlqVVjQR",
  }.freeze

  def initialize(token)
    @token = token
  end

  def get_tracks
    track_id = random_track
    track_url = "https://api.spotify.com/v1/tracks/#{track_id}"
    access_token = @token.values[0]
    authorization_bearer = { "Authorization": "Bearer #{access_token}" }

    track = JSON.parse(RestClient.get(track_url, authorization_bearer))

    {
      image: track.values[0].values[6][1].values[1],
      title: track.values[10].titlecase,
      artist: track.values[1][0].values[3],
      album: track.values[0].values[7],
    }
  end

  private

  def random_track
    RANDOM_TRACKS.values.sample
  end
end
