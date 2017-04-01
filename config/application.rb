require_relative 'boot'

require 'rails/all'
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Coolor
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = 'Brasilia'
    config.i18n.default_locale = :'pt-BR'

    RSpotify::authenticate("e5932d3611644ed1b7ac08b0140f2b59", "6cdea30120ce4de58ef1d2207824c7e3")
  end
end
