require "test_helper"

class GeocodeControllerTest < ActionDispatch::IntegrationTest
  test "should get proxy" do
    get geocode_proxy_url
    assert_response :success
  end
end
