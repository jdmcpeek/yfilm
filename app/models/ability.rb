class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)
          
            ability = user.ability #make the following code more readable
            alias_action :read, :update, :to => :ru #shorten code
          if ability == 'admin'
            can :manage, :all
          elsif ability == 'normal'
              #should users be able to 'manage' their own profiles? That includes every action, including create. Probably not.
            can :manage, Project, :producer => user.id
            can :ru, User, :id => user.id 
          else 
            can :read, Project

            
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
