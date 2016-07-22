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
  config.order = :random
  config.profile_examples = 10

  Kernel.srand config.seed

  config.before(:each) { ActionMailer::Base.deliveries.clear }
end
