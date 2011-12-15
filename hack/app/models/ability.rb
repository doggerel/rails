class Ability
  include CanCan::Ability
  def initialize(user)
    user ||=User.new
    if user.role? :administrator
      can :mange, :all
    elsif user.role? :operator
      can :manage, Post
    else
      can :read, :all
    end
    
  end
end
