module EasySwaggerUi
  module ApplicationHelper
    def swagger_routes
      Engine.routes.url_helpers
    end

    def asset_available?(path)
      if Rails.configuration.assets.compile
        Rails.application.precompiled_assets.include?(path)
      else
        Rails.application.assets_manifest.assets[path].present?
      end
    end
  end
end
