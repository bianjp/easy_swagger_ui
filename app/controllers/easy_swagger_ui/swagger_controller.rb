module EasySwaggerUi
  class SwaggerController < ApplicationController
    # get 'oauth2'
    def oauth2
    end

    # get '*doc_path'
    def view
    end

    # get '*doc_path.json'
    def spec
      if EasySwaggerUi.cache_enabled
        cache_key = "easy_swagger_ui:spec:#{params[:doc_path]}"
        options = {
          expires_in: EasySwaggerUi.cache_timeout,
          race_condition_ttl: 10,
        }
        spec = EasySwaggerUi.cache_store.fetch(cache_key, options) do
          parse_spec(params[:doc_path])
        end
      else
        spec = parse_spec(params[:doc_path])
      end
      render json: spec
    end

    protected

    def parse_file(filepath)
      erb = ERB.new(File.read(filepath), nil, '-')
      erb.location = filepath
      YAML.safe_load(erb.result) || {}
    end

    def parse_spec(path)
      doc_path = File.join(EasySwaggerUi.base_path, path)
      return {} if Dir["#{doc_path}/*.yml"].blank?

      spec = parse_file(File.join(doc_path, 'swagger.yml'))

      Dir["#{doc_path}/*.yml"].sort.each do |filepath|
        filename = File.basename(filepath, '.yml')
        next if filename == 'swagger'
        spec.merge!(filename => parse_file(filepath))
      end

      Dir["#{doc_path}/*"].sort.each do |dirpath|
        next unless File.directory?(dirpath)
        dir_name = File.basename(dirpath)
        results = Dir["#{dirpath}/*.yml"].sort.map do |filepath2|
          parse_file(filepath2)
        end
        spec.merge!(dir_name => results.reduce(&:merge!) || {})
      end

      spec['host'] = request.host_with_port unless spec.key?('host')

      spec
    end
  end
end
