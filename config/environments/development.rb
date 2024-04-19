# frozen_string_literal: true

Rails.application.configure do
  # Basic settings
  config.enable_reloading = true
  config.eager_load = false
  config.consider_all_requests_local = true
  config.server_timing = true

  # Caching
  if Rails.root.join('tmp/caching-dev.txt').exist?
    configure_caching
  else
    disable_caching
  end

  # Active Storage
  config.active_storage.service = :local

  # Mailer
  configure_mailer

  # Deprecation
  configure_deprecation

  # ActiveRecord
  configure_active_record

  # Active Job
  configure_active_job

  # Assets
  configure_assets

  # RuboCop
  configure_rubocop
end

private

def configure_caching
  config.action_controller.perform_caching = true
  config.action_controller.enable_fragment_cache_logging = true
  config.cache_store = :memory_store
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{2.days.to_i}"
  }
end

def disable_caching
  config.action_controller.perform_caching = false
  config.cache_store = :null_store
end

def configure_mailer
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false
end

def configure_deprecation
  config.active_support.deprecation = :log
  config.active_support.disallowed_deprecation = :raise
  config.active_support.disallowed_deprecation_warnings = []
end

def configure_active_record
  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true
end

def configure_active_job
  config.active_job.verbose_enqueue_logs = true
end

def configure_assets
  config.assets.quiet = true
end

def configure_rubocop
  config.generators.after_generate do |_files|
    system('bundle exec rubocop -A --fail-level=E') # Fixed typo in your command
  end
end
