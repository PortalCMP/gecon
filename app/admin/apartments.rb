ActiveAdmin.register Apartment do
	permit_params :tower_id, :name
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  sidebar "Apartment Details", only: [:show, :edit] do
    ul do
      li link_to "People", admin_apartment_people_path(resource)
    end
  end

end
