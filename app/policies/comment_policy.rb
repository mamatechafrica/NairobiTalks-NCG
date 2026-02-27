class CommentPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def update?
    user.present? && (user == record.user || user.admin?)
  end

  def edit?
    update?
  end

  def destroy?
    user.present? && (user == record.user || user.admin?)
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end
