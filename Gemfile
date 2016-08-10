# frozen_string_literal: true
source 'https://rubygems.org'

ruby '2.3.1'

gem 'rails', '~>5.0.0'
gem 'pg'
gem 'friendly_id'
gem 'puma'

# Views
gem 'autoprefixer-rails'
gem 'font-awesome-rails'
gem 'sass-rails'
gem 'slim-rails'
gem 'redcarpet'

# JS
gem 'coffee-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'uglifier'

# Image uploading
gem 'carrierwave'
gem 'cloudinary'

# Jobs
gem 'redis'
# All this mess here to get sidekiq web UI working until sinatra supports rack 2.0
gem 'sidekiq', github: 'mperham/sidekiq', branch: 'rails5'
gem 'sinatra', github: 'sinatra/sinatra', require: false
gem 'rack', '~>2.0.0'
gem 'rack-protection', github: 'sinatra/rack-protection'

# Managing contacts
gem 'sendgrid-ruby'

# Authentication
gem 'devise'
gem 'pundit'

# For awesome debugging
gem 'awesome_print', require: false
gem 'pry-rails'

group :development, :test do
  gem 'brakeman'
  gem 'bundler-audit'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'pry-byebug'
  gem 'psych' # so I can use zeus
  gem 'rspec-rails'
  gem 'spring'
end

group :development do
  gem 'i18n-tasks'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'codecov', require: false
  gem 'database_cleaner'
  gem 'formulaic'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'webmock'
end

group :production do
  gem 'rails_12factor'
end
