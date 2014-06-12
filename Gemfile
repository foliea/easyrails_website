source 'https://rubygems.org'

ruby '2.1.2'

gem 'rails', '4.1.1'
gem 'pg'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'

# Front-end
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'sass-rails', '~> 4.0.2'
gem 'compass-rails'
gem "font-awesome-rails"
gem 'bootstrap-sass'

# Image Uploading
gem 'aws-sdk'
gem 'paperclip'

# Admin editing
gem 'activeadmin', github: 'gregbell/active_admin'
gem 'mercury-rails', github: 'jejacks0n/mercury'
gem 'ace-rails-ap'

# Settings
gem 'rconfig'
gem 'app-config'

# Authentication
gem 'devise'
gem 'omniauth'
gem 'omniauth-linkedin'
gem 'omniauth-twitter'
gem 'omniauth-github'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'

# Server
gem 'puma'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'rubocop'
  gem 'rails_layout'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
end

group :test do
  gem 'formulaic'
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'coveralls', require: false
end

# Required also in development for generate
group :development, :test do
  gem 'pry-rails'
  gem 'factory_girl_rails'
  gem 'mocha'
  gem 'rspec-rails'
  gem 'dotenv-rails'
end

group :production do
  gem 'rails_12factor'
  gem 'newrelic_rpm'
end
