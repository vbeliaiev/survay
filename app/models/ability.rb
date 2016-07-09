class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    end

    if user.regular?
      can :read, Quiz, status: 'active'
      can :create_attempt, Quiz
      can :view_result, Attempt, user: user
    end

    cannot :create_attempt, Quiz do |quiz|
      quiz.draft?
    end
  end
end
