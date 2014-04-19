require File.expand_path('../boot', __FILE__)

require 'rails/all'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module EasyRailsWebsite
  class Application < Rails::Application
    config.i18n.default_locale = :en
    config.autoload_paths += Dir[Rails.root.join('presenters', '*', '*.rb').to_s]

    # Force locale on Heroku
    I18n.config.enforce_available_locales = false
    I18n.load_path += Dir[Rails.root.join('config', 'locales', '*.yml').to_s]
    I18n.reload!

    config.after_initialize do
      if Setting.table_exists?
        AppConfig.configure(:model => Setting)
        AppConfig.load
      end
      
      if Language.table_exists?
        I18n.default_locale = Language.get_default.locale
        I18n.available_locales = Language.available_locales
      end
    end

  end
end
