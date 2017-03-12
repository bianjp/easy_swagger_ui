require 'easy_swagger_ui/engine'
require 'easy_swagger_ui/version'
require 'easy_swagger_ui/configuration'
require 'easy_swagger_ui/route_matcher'

module EasySwaggerUi
  class << self
    # Get configuration easily
    delegate(*Configuration::OPTIONS, to: :configuration)

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield configuration
    end
  end
end
