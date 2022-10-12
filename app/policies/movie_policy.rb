class MoviePolicy < ApplicationPolicy
  def index?
    cashier_or_manager?
  end

  def show?
    true
  end

  def new?
    manager?
  end

  def edit?
    manager?
  end

  def create?
    manager?
  end

  def update?
    manager?
  end

  def destroy?
    manager?
  end

  private

  def manager?
    user.manager?
  end

  def cashier_or_manager?
    user.cashier? || user.manager?
  end
end
