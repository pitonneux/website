# frozen_string_literal: true
require_relative 'config/application'

Rails.application.load_tasks
task(:default).clear
task default: [:spec]

if defined? RSpec
  task(:spec).clear
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.verbose = false
  end
end

task default: 'bundler:audit'
task default: 'brakeman:run' if Date.today.day == 7

