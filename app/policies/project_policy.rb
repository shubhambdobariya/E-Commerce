# app/policies/project_policy.rb
class ProjectPolicy < ApplicationPolicy
  attr_reader :user, :project

  def initialize(user, project)
    @user = user
    @project = project
  end

  def index?
    true  
    
  end

  def show?
    user.admin? || project.developers.include?(user)  
  end

  def create?
    user.admin? 
  end

  def new?
    create?
  end

  def update?
    user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    user.admin?  
  end

  def check_tickets?
    user.admin?  
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all 
      else
        scope.joins(:developers).where(developers: { id: user.id })
      end
    end
  end
end
