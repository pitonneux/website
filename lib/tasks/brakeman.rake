# frozen_string_literal: true
if Rails.env.development? || Rails.env.test?
  require 'brakeman'

  namespace :brakeman do
    desc 'Run Brakeman'
    task :run, :output_file do |_t, args|
      tracker = Brakeman.run app_path: '.', output_file: args[:output_file]

      puts tracker.report if args[:output_file].nil?
    end
  end
end
