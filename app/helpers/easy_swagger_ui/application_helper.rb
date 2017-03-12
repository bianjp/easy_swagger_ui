module EasySwaggerUi
  module ApplicationHelper
    def swagger_routes
      Engine.routes.url_helpers
    end
  end
end
