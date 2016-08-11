# frozen_string_literal: true
ENV['RAILS_ENV'] = 'test'
require 'spec_helper'

require File.expand_path('../../config/environment', __FILE__)
abort('DATABASE_URL environment variable is set') if ENV['DATABASE_URL']

require 'rspec/rails'
require 'pundit/rspec'
require 'capybara/rspec'

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

RSpec.configure do |config|
  config.reset
  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = false

  config.include Features, type: :feature
  config.include ActiveJob::TestHelper, type: :job
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Warden::Test::Helpers
  config.before(:suite) { Warden.test_mode!  }
  config.after(:each)   { Warden.test_reset! }
end
