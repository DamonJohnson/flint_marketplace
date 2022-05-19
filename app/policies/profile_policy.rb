# frozen_string_literal: true

class ProfilePolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    return @user.has_role? :profile_owner, @record
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    return @user.has_role? :profile_owner, @record
  end

  def edit?
    return @user.has_role? :profile_owner, @record
  end

  def destroy?
    return @user.has_role? :profile_owner, @record
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
