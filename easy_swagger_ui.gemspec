$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'easy_swagger_ui/version'

Gem::Specification.new do |s|
  s.name        = 'easy_swagger_ui'
  s.version     = EasySwaggerUi::VERSION
  s.authors     = ['Bian Jiaping']
  s.email       = ['ssbianjp@gmail.com']
  s.homepage    = 'https://github.com/bianjp/easy_swagger_ui'

  s.summary     = <<-EOF.strip.gsub(/[[:space:]]+/, ' ')
    Mountable Rails plugin that serve your API documentation written
    in YAML files via Swagger UI
  EOF

  s.description = <<-EOF.strip.gsub(/[[:space:]]+/, ' ')
    Manage swagger API documentation in YAML file, and separate them into
    multiple files for ease of management.
    Automatically parse and serve via Swagger UI.
  EOF

  s.license = 'MIT'

  s.files = Dir[
    '{app,config,db,lib}/**/*',
    'MIT-LICENSE',
    'Rakefile',
    'README.md',
    'CHANGELOG.md',
  ]

  s.add_dependency 'rails'
  s.add_dependency 'activesupport'

  s.add_development_dependency 'rails', '~> 5.0'
  s.add_development_dependency 'puma', '~> 3.8'
  s.add_development_dependency 'rubocop', '~> 0.48.1'
end
