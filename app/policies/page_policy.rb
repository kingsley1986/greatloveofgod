class PagePolicy < ApplicationPolicy
  def edit?
    user.roles.to_s.include?("pastor")
  end

  def update?
    user.roles.to_s.include?("pastor")
  end

  def destroy?
    user.roles.to_s.include?("pastor")
  end
  def create?
    user.roles.to_s.include?("pastor")
  end

  def new?
    user.roles.to_s.include?("pastor")
  end
end
