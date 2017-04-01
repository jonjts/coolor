require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "e5932d3611644ed1b7ac08b0140f2b59", "6cdea30120ce4de58ef1d2207824c7e3", scope: 'user-read-email playlist-modify-public user-library-read user-library-modify streaming user-read-private user-top-read'
end
