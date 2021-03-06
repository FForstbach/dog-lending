class DogPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all

      # For a multi-tenant SaaS app, you may want to use:
      # scope.where(user: user)
    end
  end

  def new?
    true
  end

  def show?
    true
  end

  def index?
    true
  end

  def availability?
    true
  end

  def dashboard?
    record.user == user
  end

  def create?
    true
  end

  def update?
    record.user == user
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    record.user == user
  end
end
