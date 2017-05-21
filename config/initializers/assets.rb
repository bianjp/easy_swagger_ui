if Gem::Version.new(Sprockets::VERSION) >= Gem::Version.new('4.x')
  Rails.application.config.assets.precompile += %w[easy_swagger_ui_manifest.js]
else
  Rails.application.config.assets.precompile += %w[
    easy_swagger_ui/*.png
    easy_swagger_ui/*.gif
    easy_swagger_ui/*.jpg
    easy_swagger_ui/print.css
    easy_swagger_ui/lang/*.js
  ]
end
