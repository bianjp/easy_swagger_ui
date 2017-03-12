Rails.application.routes.draw do
  mount EasySwaggerUi::Engine => '/docs'
end
