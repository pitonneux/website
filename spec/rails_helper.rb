# frozen_string_literal: true
ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
abort('DATABASE_URL environment variable is set') if ENV['DATABASE_URL']

require 'spec_helper'
require 'rspec/rails'
require 'pundit/rspec'
require 'capybara/rspec'
require 'simplecov'
require 'coveralls'

Coveralls.wear!('rails')
# SimpleCov.formatter = Coveralls::SimpleCov::Formatter

# save to CircleCI's artifacts directory if we're on CircleCI
if ENV['CIRCLE_ARTIFACTS']
  dir = File.join(ENV['CIRCLE_ARTIFACTS'], 'coverage')
  SimpleCov.coverage_dir(dir)
end

#
# SimpleCov.formatter = Coveralls::SimpleCov::Formatter
# SimpleCov.start do
#   add_filter 'app/secrets'
# end

Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |file| require file }

Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |file| require file }

Capybara.javascript_driver = :webkit

Capybara::Webkit.configure(&:block_unknown_urls)

module Features
  include Formulaic::Dsl
  include SelectDateHelpers
  include SessionHelpers
  include SidekiqHelpers
end

ActiveRecord::Migration.maintain_test_schema!
