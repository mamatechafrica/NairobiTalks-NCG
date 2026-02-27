class CommunityIdeaPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def upvote?
    user.present? && user != record.user
  end

  def downvote?
    upvote?
  end

  def approve?
    user&.admin?
  end

  def reject?
    user&.admin?
  end

  def update?
    user&.admin?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user&.admin?
        scope.all
      else
        scope.all
      end
    end
  end
end
