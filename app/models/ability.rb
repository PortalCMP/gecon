# app/models/ability.rb
class Ability
  include CanCan::Ability

  def initialize(admin_user)
  	#admin_user ||= AdminUser.new # guest user?
    #can :manage, Post
    #can :read, :all
    # can :read, AdminUser
    # can :manage, AdminUser, id: admin_user.id
    can :manage, :all if admin_user.role == "admin"
    can :read, Condominium
    can :read, Block
    can :read, Tower
    can :manage, Apartment
    can :read, ActiveAdmin::Page, name: "Dashboard"#, namespace_name: :admin
  end

end