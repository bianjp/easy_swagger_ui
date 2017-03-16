EasySwaggerUi::Engine.routes.draw do
  get 'oauth2', to: 'swagger#oauth2', format: false

  constraints(EasySwaggerUi::RouteMatcher) do
    get '/', to: 'swagger#view', format: false, doc_path: ''
    get '.json', to: 'swagger#spec', format: false, doc_path: ''

    # when docs are in sub directories
    get '*doc_path', to: 'swagger#view', format: false, as: 'view'
    get '*doc_path.json', to: 'swagger#spec', format: false, as: 'spec'
  end
end
