class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index
    record.user == user
  end
  
  def show?
    true
  end
  
  def create?
    true
  end
  
  def update?
    # true
    record.user == user
  end
  
  def destroy?
    # true
    record.user == user
  end
end
