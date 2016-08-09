# frozen_string_literal: true
# save to CircleCI's artifacts directory if we're on CircleCI
require 'simplecov'
SimpleCov.start 'rails' do
  add_filter '/spec/'
end

require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov

if ENV['CIRCLE_ARTIFACTS']
  dir = File.join(ENV['CIRCLE_ARTIFACTS'], 'coverage')
  SimpleCov.coverage_dir(dir)
end

require 'webmock/rspec'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

WebMock.disable_net_connect!(allow_localhost: true)

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
