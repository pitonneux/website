# frozen_string_literal: true
Rails.application.configure do
  config.action_controller.allow_forgery_protection = false
  config.action_controller.perform_caching = false
  config.action_dispatch.show_exceptions = false

  config.action_mailer.delivery_method = :test
  config.action_mailer.perform_caching = false
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true

  config.action_view.raise_on_missing_translations = true
  config.active_job.queue_adapter = :sidekiq
  config.active_support.deprecation = :stderr
  config.assets.raise_runtime_errors = true
  config.cache_classes = true
  config.consider_all_requests_local = true
  config.eager_load = false
  config.public_file_server.enabled = true
  config.public_file_server.headers = { 'Cache-Control' => 'public, max-age=3600' }
end
