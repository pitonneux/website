# frozen_string_literal: true
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

  config.disable_monkey_patching!
  config.example_status_persistence_file_path = 'tmp/rspec_examples.txt'
  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!
  config.order = :random
  config.profile_examples = 10
  config.use_transactional_fixtures = false

  Kernel.srand config.seed

  config.before(:each) { ActionMailer::Base.deliveries.clear }

  config.include Features, type: :feature
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Warden::Test::Helpers
  config.before(:suite) { Warden.test_mode!  }
  config.after(:each)   { Warden.test_reset! }
end
