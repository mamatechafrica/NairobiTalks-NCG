require "test_helper"

class AiSummariesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get ai_summaries_show_url
    assert_response :success
  end
end
