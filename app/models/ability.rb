class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    end

    if user.regular?
      can :read, Quiz, status: 'active'
    end

    cannot :create_attempt, Quiz do |quiz|
      quiz.draft? #and user hasn't finished this quiz
    end
  end
end
