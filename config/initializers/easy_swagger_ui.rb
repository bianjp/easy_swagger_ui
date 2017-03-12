EasySwaggerUi.configure do |config|
  config.base_path = Rails.root.join('doc')
  config.cache_enabled = !Rails.env.development?
  config.cache_timeout = 30.minutes
  config.cache_store = ActiveSupport::Cache::MemoryStore.new
  config.validator_enabled = false
end
