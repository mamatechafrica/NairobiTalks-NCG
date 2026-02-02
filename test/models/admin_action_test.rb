require "test_helper"

class AdminActionTest < ActiveSupport::TestCase
  self.use_transactional_tests = true
  def setup
    @admin = User.create!(email: "admin@example.com", password: "password", admin: true)
    @idea = CommunityIdea.create!(title: "Test Idea", body: "Test body", user: @admin)
  end

  def test_log_action_creation
    Current.user = @admin
    Current.ip_address = "127.0.0.1"
    Current.user_agent = "Test Agent"

    action = AdminAction.log!(@admin, "create", @idea, { test: "metadata" })

    assert action.persisted?
    assert_equal @admin, action.user
    assert_equal "create", action.action
    assert_equal "CommunityIdea", action.record_type
    assert_equal @idea.id, action.record_id
    assert_equal "127.0.0.1", action.ip_address
    assert_equal "Test Agent", action.user_agent
    assert_equal({ "test" => "metadata" }, action.metadata)
  end

  def test_recent_scope
    old_action = AdminAction.create!(user: @admin, action: "old_action", created_at: 1.hour.ago)
    new_action = AdminAction.create!(user: @admin, action: "new_action")

    recent = AdminAction.recent
    assert_equal new_action, recent.first
    assert_equal old_action, recent.second
  end

  def test_for_record_scope
    matching_action = AdminAction.create!(user: @admin, action: "test", record_type: "CommunityIdea", record_id: @idea.id)
    other_action = AdminAction.create!(user: @admin, action: "other", record_type: "User", record_id: @admin.id)

    record_actions = AdminAction.for_record(@idea)
    assert_includes record_actions, matching_action
    assert_not_includes record_actions, other_action
  end

  def teardown
    Current.user = nil
    Current.ip_address = nil
    Current.user_agent = nil
  end
end
