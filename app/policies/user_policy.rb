class UserPolicy < ApplicationPolicy
  def show?
    user.present? && (user == record || user.admin?)
  end

  def update?
    user.present? && (user == record || user.admin?)
  end

  def edit?
    update?
  end

  def destroy?
    user&.admin? && user != record
  end

  def dashboard?
    show?
  end

  def toggle_admin?
    user&.admin? && user != record
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user&.admin?
        scope.all
      else
        scope.where(id: user.id)
      end
    end
  end
end
