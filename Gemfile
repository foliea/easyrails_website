source 'https://rubygems.org'

ruby '2.1.2'

gem 'rails', '4.1.1'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.2'
gem 'compass-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
#gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'

# Front-end
gem 'bootstrap-sass'
gem "font-awesome-rails"

# Image Uploading
gem 'aws-sdk'
gem 'paperclip'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

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

# Monitoring
gem 'newrelic_rpm'

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
  gem 'shoulda'
  gem 'shoulda-matchers'
  gem 'capybara'
end

# Required also in development for generate
group :development, :test do
  gem 'pry-rails'
  gem 'factory_girl_rails'
  gem 'mocha'
  gem 'rspec-rails'
end

group :production do
  gem 'rails_12factor'
end
