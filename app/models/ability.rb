# app/models/ability.rb
class Ability
    include CanCan::Ability
  
    def initialize(user)
      user ||= User.new  # guest user (not logged in)
  
      if user.admin?
        can :assign_project, Developer
      else
        cannot :assign_project, Developer, name: user.name
      end
    end
  end
  