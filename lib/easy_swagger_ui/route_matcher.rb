module EasySwaggerUi
  module RouteMatcher
    def self.matches?(request)
      return false unless request.params[:doc_path] =~ %r{\A[\w\-/]*\z}
      filepath = File.join(
        EasySwaggerUi.base_path,
        request.params[:doc_path],
        'swagger.yml'
      )
      File.file?(filepath)
    end
  end
end
