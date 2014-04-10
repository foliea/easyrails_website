require File.expand_path('../boot', __FILE__)

require 'rails/all'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module EasyRailsWebsite
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    #config.assets.initialize_on_precompile = false
    #config.serve_static_assets = true

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.autoload_paths += Dir[Rails.root.join('presenters', '*', '*.rb').to_s]

    # Force locale on Heroku
    I18n.config.enforce_available_locales = true
    I18n.load_path += Dir[Rails.root.join('config', 'locales', '*.yml').to_s]
    I18n.reload!

    config.after_initialize do
      AppConfig.configure(:model => Setting)
      if Setting.table_exists?
        AppConfig.load
        Settings.reload
      end
    end

  end
end
