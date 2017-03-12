# EasySwaggerUi

Mountable Rails plugin that serve your API documentation written in YAML files via Swagger UI.

Test against Rails 5.x. Should also work with Rails 4.2.x.

Swagger UI version: 2.2.10. Accessible by in `EasySwaggerUi::SWAGGER_UI_VERSION`.

## Features

* Parse API documentation in YAML files and serve as JSON to be consumed by Swagger UI
* separate your documentation into multiple YAML files for ease of management
* Support using ERB in YAML files
* Serve Swagger UI

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'easy_swagger_ui', '~> 0.1'
```

And then execute:
```bash
$ bundle
```

## Usage

### Mount

Mount it in `config/routes.rb`:

```
# Change the mount point as you like
mount EasySwaggerUi::Engine => '/docs'
```

### Write your API documentation

Your documentation should match the requirement of [Swagger Specification](http://swagger.io/specification/). See examples at [Swagger Online Editor](http://editor.swagger.io/).

Place them under `EasySwaggerUi.base_path` (default to `<Rails.root>/doc`).

1. You should have a `swagger.yml` file in your documentation path.
2. You can extract something from `swagger.yml` into separate YAML file or into sub directories. See example in [test/dummy/doc](./test/dummy/doc).
3. If you have multiple versions of documentation, you can place each version in a sub directory under `EasySwaggerUi.base_path`. Just make sure each version has a `swagger.yml` file.

### Visit Swagger UI

You can visit Swagger UI at http://localhost:3000/docs.

If you place documentation in sub directories, append the name of sub directory into the URL.

## Configuration

Create an initializer, such as `config/initializers/easy_swagger_ui.rb`:

```ruby
EasySwaggerUi.configure do |config|
  config.base_path = Rails.root.join('doc', 'api')
end
```

Supported configuration options:

* `base_path`: `String` or `Pathname`. Base path of your documentation. Absolute path or relative path relative to `Rails.root`. Default to `Rails.root.join('doc')`.
* `cache_enabled`: Boolean. Whether or not to cache parsing result of YAML files. Default to `!Rails.env.development?`
* `cache_timeout`: `ActiveSupport::Duration`. How long should cache be valid. Default to `30.minutes`
* `cache_store`: `ActiveSupport::Cache::Store`. What cache store to use. Default to `ActiveSupport::Cache::MemoryStore.new`
* `validator_enabled`: Boolean. Whether or not validate swagger specification. Default to `false`.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
