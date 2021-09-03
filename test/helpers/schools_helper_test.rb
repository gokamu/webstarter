require "test_helper"

class SchoolsHelperTest < ActionDispatch::IntegrationTest
  setup do
    @school = schools(:one)
  end

  test "should get domain instead" do
    get school_url(@school)
    assert_response :success
  end
end
