class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.regular?
      can :read, Story
      can :update, Story
      can :share, Story
      can :split, Story
    end
  end
end
