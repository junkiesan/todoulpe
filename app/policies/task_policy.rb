class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
    # Legend
    # - record: the truck passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  def index
    @tasks = policy_scope(Task)
    record.user == current_user
  end
  
    def show?
      record.user == current_user
    end
  
    def create?
      record.user == current_user
    end
  
    def update?
      record.user == current_user
    end
  
    def destroy?
      record.user == current_user
    end
  
    def write_comment
      true # Anyone can write a comment
    end
end
