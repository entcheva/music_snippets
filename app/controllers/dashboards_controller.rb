require "rspotify"

class DashboardsController < ApplicationController
  def index
    @user = current_user
  end

  def show
    @activities = current_user.activities.order("created_at DESC")

    @arctic_monkeys = RSpotify::Artist.find('7Ln80lUS6He07XvHI8qqHH')

    # RSpotify::authenticate(ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_CLIENT_SECRET"])
    # me = RSpotify::User.find("christinaent")
    # @playlists = me.playlists
  end

end
