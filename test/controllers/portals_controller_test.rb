require 'test_helper'

class PortalsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get portals_home_url
    assert_response :success
  end

end
