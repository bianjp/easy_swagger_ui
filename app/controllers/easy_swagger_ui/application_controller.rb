module EasySwaggerUi
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    layout false
    helper EasySwaggerUi::ApplicationHelper
  end
end
