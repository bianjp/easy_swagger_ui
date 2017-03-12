module EasySwaggerUi
  class Configuration
    # Configurable options
    OPTIONS = [
      :base_path,
      :cache_enabled,
      :cache_timeout,
      :cache_store,
      :validator_enabled,
    ].freeze

    attr_accessor(*OPTIONS)

    # Avoid method redefined warning
    remove_method :base_path=, :cache_store=
    # remove_method :cache_store=

    # Make sure it's an absolute path
    def base_path=(path)
      @base_path = File.absolute_path(path, Rails.root)
    end

    # Evaluate lambda when needed
    def cache_store=(store)
      @cache_store = store.respond_to?(:call) ? store.call : store
    end

    def to_h
      OPTIONS.each_with_object({}) do |key, config|
        config[key] = send(key)
      end
    end
  end
end
