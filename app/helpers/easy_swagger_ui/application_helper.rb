module EasySwaggerUi
  module ApplicationHelper
    def swagger_routes
      Engine.routes.url_helpers
    end

    def load_translation_if_available
      translation_js = "easy_swagger_ui/lang/#{I18n.locale.to_s.downcase}.js"
      return unless asset_available?(translation_js)
      javascript_include_tag('easy_swagger_ui/lang/translator', translation_js)
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
