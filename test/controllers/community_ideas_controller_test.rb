require "test_helper"

class CommunityIdeasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get community_ideas_index_url
    assert_response :success
  end

  test "should get upvote" do
    get community_ideas_upvote_url
    assert_response :success
  end

  test "should get downvote" do
    get community_ideas_downvote_url
    assert_response :success
  end
end
