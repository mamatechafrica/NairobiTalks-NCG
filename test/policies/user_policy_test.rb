require "test_helper"

class UserPolicyTest < ActiveSupport::TestCase
  self.use_transactional_tests = true
  def setup
    @user = User.create!(email: "user@example.com", password: "password")
    @admin = User.create!(email: "admin@example.com", password: "password", admin: true)
    @other_user = User.create!(email: "other@example.com", password: "password")
  end

  def test_scope
    # Admins can see all users
    admin_scope = Pundit.policy_scope(@admin, User)
    assert_includes admin_scope, @user
    assert_includes admin_scope, @admin
    assert_includes admin_scope, @other_user

    # Regular users can only see themselves
    user_scope = Pundit.policy_scope(@user, User)
    assert_includes user_scope, @user
    assert_not_includes user_scope, @other_user
    assert_not_includes user_scope, @admin
  end

  def test_show
    # Users can see themselves
    assert Pundit.policy(@user, @user).show?
    assert_not Pundit.policy(@user, @other_user).show?

    # Admins can see any user
    assert Pundit.policy(@admin, @user).show?
    assert Pundit.policy(@admin, @other_user).show?
    assert Pundit.policy(@admin, @admin).show?
  end

  def test_update
    # Users can update themselves
    assert Pundit.policy(@user, @user).update?
    assert_not Pundit.policy(@user, @other_user).update?

    # Admins can update any user
    assert Pundit.policy(@admin, @user).update?
    assert Pundit.policy(@admin, @other_user).update?
  end

  def test_destroy
    # Admins can delete other users but not themselves
    assert Pundit.policy(@admin, @user).destroy?
    assert_not Pundit.policy(@admin, @admin).destroy?

    # Regular users cannot delete anyone
    assert_not Pundit.policy(@user, @user).destroy?
    assert_not Pundit.policy(@user, @other_user).destroy?
  end

  def test_toggle_admin
    # Admins can toggle admin status of other users
    assert Pundit.policy(@admin, @user).toggle_admin?
    assert_not Pundit.policy(@admin, @admin).toggle_admin?

    # Regular users cannot toggle admin status
    assert_not Pundit.policy(@user, @user).toggle_admin?
    assert_not Pundit.policy(@user, @other_user).toggle_admin?
  end
end
