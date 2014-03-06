require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module FolieMyblog
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    
    # Force locale on Heroku
    I18n.load_path += Dir[Rails.root.join('config', 'locales', '*.yml').to_s]
    I18n.reload!
    
    config.after_initialize do
      # Set default_locale according to database
      I18n.default_locale = Language.where(default: true).first.code
      
      # Set default language menu here
      
      # RENDRE PARAMETRABLES VIA DB
      #
      # Set default title here
      config.site_title = 'Adrien Folie Tech Blog'
      config.site_title_link = 'http://project-livec9baf8578360.rhcloud.com'
      ActiveAdmin.setup do |cactive_admin|
        cactive_admin.site_title = config.site_title
      end
      
    end
  end
end
