class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    end

    if user.regular?
      can :read, Quiz, status: [active: true]
    end
  end
end
