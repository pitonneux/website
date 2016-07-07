# frozen_string_literal: true
Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true
  config.action_controller.perform_caching = false

  config.active_job.queue_adapter = :sidekiq

  config.action_mailer.default charset: 'utf-8'
  config.action_mailer.default_url_options = { host: 'localhost:3000' }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_caching = false
  config.action_mailer.perform_deliveries = true
  config.action_mailer.preview_path = "#{Rails.root}/spec/mailers/previews"
  config.action_mailer.raise_delivery_errors = true

  config.action_mailer.smtp_settings = {
    address:        'smtp.sendgrid.net',
    authentication: :plain,
    domain:         'localhost:3000',
    enable_starttls_auto: true,
    password:       ENV['SENDGRID_PASSWORD'],
    port:           587,
    user_name:      ENV['SENDGRID_USERNAME'],
  }

  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load

  config.assets.debug = true
  config.assets.digest = true
  config.assets.quiet = true
  config.assets.raise_runtime_errors = true

  config.action_view.raise_on_missing_translations = true
end
