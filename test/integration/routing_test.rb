require 'test_helper'

module EasySwaggerUi
  class RoutingTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @routes = Engine.routes
    end

    test 'route matched' do
      assert_routing(
        {path: 'v1', method: :get},
        {controller: 'easy_swagger_ui/swagger', action: 'view', doc_path: 'v1'}
      )

      assert_routing(
        {path: 'v1.json', method: :get},
        {controller: 'easy_swagger_ui/swagger', action: 'spec', doc_path: 'v1'}
      )
    end

    test 'route not found when directory not exist' do
      assert_raise(ActionController::RoutingError) do
        get view_path('v2')
      end

      assert_raise(ActionController::RoutingError) do
        get spec_path('v2')
      end
    end

    test 'route not found when directory not contain swagger.yml' do
      assert_raise(ActionController::RoutingError) do
        get view_path('v1/paths')
      end

      assert_raise(ActionController::RoutingError) do
        get spec_path('v1/paths')
      end
    end
  end
end
