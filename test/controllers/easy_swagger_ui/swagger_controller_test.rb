require 'test_helper'

module EasySwaggerUi
  class SwaggerControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @routes = Engine.routes
    end

    test 'view should work successfully' do
      get view_path('v1')
      assert_response :success
      assert_select '#swagger-ui-container'
    end

    test 'oauth2 should work successfully' do
      get oauth2_path
      assert_response :success
      assert_match(/\A<script>/, @response.body)
    end

    test 'spec should be parsed successfully' do
      get spec_path('v1')
      assert_response :success
      assert_equal 'application/json', @response.content_type
      assert_not @response.body.blank?
      result = JSON.parse(@response.body)
      assert result.key?('swagger')
    end
  end
end
