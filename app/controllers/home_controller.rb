class HomeController < ApplicationController
  before_action :init_lastfm
  @spotify_user

  def index
  end

  def spotify
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    # Now you can access user's private data, create playlists and much more

    # Access private data
    @spotify_user.country #=> "US"
    @spotify_user.email   #=> "example@email.com"
  end

  def playlist
    case params[:color_selected]
    when "#58EC00" #Verde
      find_playlist LastFM::Tag.get_top_tracks(:tag => green_tag, :limit => 3)
    when "#0087EC" #Azul
      find_playlist LastFM::Tag.get_top_tracks(:tag => blue_tag)
    when "#CC0000" #Vermelho
      find_playlist LastFM::Tag.get_top_tracks(:tag => red_tag, :limit => 3)
    when "#FF5A00" #Laranja
      find_playlist LastFM::Tag.get_top_tracks(:tag => orange_tag, :limit => 3)
    else
      find_playlist LastFM::Tag.get_top_tracks(:tag => "animated", :limit => 3)
    end
    respond_to do |format|
      format.js
    end
  end

  private

  def find_playlist (songs)
    position = Random.rand(2)
    song = ""
    songs["tracks"]["track"].each_with_index do |track, index|
      if index == position
        song = track["name"]
      end
    end
    @playlist =  RSpotify::Playlist.search(song)[Random.rand(5)]

  end

  def init_lastfm
    LastFM.api_key = "02012619a31a311a97f7d0fe6c3c50ad"
    LastFM.client_name = "Coolor"
  end

  def green_tag
    array = ["Calm", "Pacific"]
    array[Random.rand(1)]
  end

  def blue_tag
    array = ["Trust", "Sure"]
    array[Random.rand(1)]
  end

  def red_tag
    array = ["Love", "Revenge"]
    array[Random.rand(1)]
  end

  def orange_tag
    array = ["Happy", "Celebrate"]
    array[Random.rand(1)]
  end

end
