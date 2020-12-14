require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get admins_dashboard_url
    assert_response :success
  end

end
