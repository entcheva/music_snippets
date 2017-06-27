class SpotifyAuthenticator
  def authenticate
    url = "https://accounts.spotify.com/api/token"
    grant_type = { grant_type: "client_credentials" }
    authorization_basic = { "Authorization": "Basic #{client_token}" }

    JSON.parse(RestClient.post(url, grant_type, authorization_basic).body)
  end

  private

  def client_token
    Base64.strict_encode64(
      [SPOTIFY_CLIENT_ID, SPOTIFY_CLIENT_SECRET].join(":"),
    ).delete("\n")
  end
end
