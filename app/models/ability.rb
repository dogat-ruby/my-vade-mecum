class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    unless user
      can :read,Book do |book|
        book.is_approved==true
      end
      can :search,Book
    else
      if user.admin?
        can :manage, :all
        can :read, ActiveAdmin::Page
        can :read, ActiveAdmin::Page, :name => "Dashboard"
      elsif user.is_blocked?
        can :read,Book do |book|
          book.is_approved==true
        end
        can :search,Book
        can :stop_impersonating,User
      else
        can :create,Book
        can :read,Book do |book|
          book.is_approved==true
        end
        can [:read,:update,:destroy],Book  do |book|
          book.owner==user
        end
        can :create,Review
        can :search,Book
        can :stop_impersonating,User
        can :profile,User
        can :settings,User
      end
    end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
