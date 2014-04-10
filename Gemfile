source 'https://rubygems.org'

ruby '1.9.3'

gem 'rails', '4.0.0'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'
gem 'jquery-migrate-rails'

gem 'bootstrap-sass'
gem "font-awesome-rails"

gem 'paperclip', github: 'thoughtbot/paperclip'
gem 'aws-sdk'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'devise'

gem 'app-config'
gem 'activeadmin', github: 'gregbell/active_admin'
gem 'rconfig'

gem 'omniauth'
gem 'omniauth-linkedin'
gem 'omniauth-twitter'
gem 'omniauth-github'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'thin'
gem 'mercury-rails', github: 'jejacks0n/mercury'

group :development do
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

group :development, :test do
  gem 'pry-rails'
  gem 'factory_girl_rails'
  gem 'mocha'
  gem 'rspec-rails'
end

group :production do
  gem 'rails_12factor'
end
