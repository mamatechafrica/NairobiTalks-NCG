require "test_helper"

class Admin::DashboardControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = users(:admin) # Assuming a fixture for admin users exists
    sign_in @admin
  end

  test "should get dashboard with correct statistics" do
    get admin_dashboard_url
    assert_response :success

    assert_select "h3", text: /\d+/, count: 3 # Statistics cards
    assert_select "h5", text: "Recent Community Ideas"
    assert_select "h5", text: "Recent Documents"
  end

  test "should display quick actions" do
    get admin_dashboard_url
    assert_response :success

    assert_select "a", text: "View Analytics"
    assert_select "a", text: "Export Data"
  end
end
