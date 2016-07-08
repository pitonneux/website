# frozen_string_literal: true
source 'https://rubygems.org'

ruby '2.3.1'

gem 'rails', '~>5.0.0'
gem 'pg'

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

# Server
gem 'puma'

# Jobs
gem 'sidekiq'
gem 'redis'

# Authentication
gem 'devise'
gem 'pundit'

group :development, :test do
  gem 'brakeman'
  gem 'bundler-audit'
  gem 'factory_girl_rails'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'spring'
end

group :development do
  gem 'awesome_print'
  gem 'i18n-tasks'
  gem 'web-console', '~> 2.0'
end

group :test do
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'formulaic'
  gem 'launchy'
  gem 'shoulda-matchers'

  # test coverage
  gem 'coveralls', require: false
end

group :production do
  gem 'rails_12factor'
end
