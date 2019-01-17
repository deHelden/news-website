class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    elsif user.publisher?
      can :manage, Post
      can :read, :all
    elsif user.correspondent?
      can :manage, Post, user_id: user.id
      can :read, :all
    else
      can :read, Post
    end
  end
end
