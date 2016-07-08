if Rails.env.development? || Rails.env.test?
  require 'brakeman'

  namespace :brakeman do
    desc 'Run Brakeman'
    task :run, :output_file do |t, args|

      tracker = Brakeman.run app_path: '.', output_file: args[:output_file]

      if args[:output_file].nil?
        puts tracker.report
      end
    end
  end
end
