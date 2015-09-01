class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new

    if user.admin?
      can :manage, :all
      can :mark_exam, status: :unchecked
    else
      can :read, :all
      can :create, [Question, Exam]
      can :update, [Question, Exam, Result]
    end
  end
end
