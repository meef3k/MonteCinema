class ReservationPolicy < ApplicationPolicy
  def index?
    cashier_or_manager?
  end

  def show?
    cashier_or_manager? || client?
  end

  def new?
    true
  end

  def edit?
    cashier_or_manager?
  end

  def create?
    true
  end

  def update?
    cashier_or_manager?
  end

  private

  def cashier_or_manager?
    user.cashier? || user.manager?
  end

  def client?
    user.client?
  end
end