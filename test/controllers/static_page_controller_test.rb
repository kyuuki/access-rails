require "test_helper"

class StaticPageControllerTest < ActionDispatch::IntegrationTest
  test "should get root" do
    get static_page_root_url
    assert_response :success
  end
end
