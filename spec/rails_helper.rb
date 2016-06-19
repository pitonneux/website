# frozen_string_literal: true
ENV['RAILS_ENV'] = 'test'

require File.expand_path('../../config/environment', __FILE__)
abort('DATABASE_URL environment variable is set') if ENV['DATABASE_URL']

Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |file| require file }

require 'rspec/rails'
require 'pundit/rspec'

Capybara.javascript_driver = :webkit

Capybara::Webkit.configure(&:block_unknown_urls)

module Features
  include Formulaic::Dsl
  include SelectDateHelpers
  include SessionHelpers
end

RSpec.configure do |config|
  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = false

  config.include Features, type: :feature

  config.include Devise::TestHelpers, type: :controller
  config.include Warden::Test::Helpers
  config.before(:suite) { Warden.test_mode!  }
  config.after(:each)   { Warden.test_reset! }
end

ActiveRecord::Migration.maintain_test_schema!
