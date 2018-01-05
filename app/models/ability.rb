# app/models/ability.rb
class Ability
  include CanCan::Ability

  def initialize(admin_user)
    if admin_user.superadmin?
    	can :manage, :all
    end 
    if admin_user.admin?
    	can :read, [VehicleBrand]
    	can :manage, [AdminUser, Person, VehicleModel, VehicleColor, Vehicle]
    	cannot :create, AdminUser, role: [:superadmin, :admin]
    	cannot :update, AdminUser, role: [:superadmin, :admin]
    	cannot :destroy, :all
    end
    if admin_user.user?
    	can [:read, :update], AdminUser, id: admin_user.id
    	can :read, [Person, VehicleModel, VehicleColor, Vehicle]
    end
    can :read, ActiveAdmin::Page, name: "Dashboard"#, namespace_name: :admin
  end

end