class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.where(user: user)
      scope.all
    end
  end

  # def new?
  #   true
  # end

  def create?
    true
  end

  def show?
    true
  end

  # def edit?
  #   # If the owner of the restaurant => true
  #   # otherwise => false
  #   # current_user => user
  #   # record => @restaurant
  #   record.user == user
  #   # 5 lines below are same as line above
  #   # if record.user == user
  #   #   true
  #   # else
  #   #   false
  #   # end
  # end

  def update?
    check_if_admin?
  end

  def destroy?
    check_if_admin?
  end

  def check_if_admin?
    record.user == user || user.admin
  end
end
