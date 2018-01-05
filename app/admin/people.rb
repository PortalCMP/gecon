ActiveAdmin.register Person do
	permit_params :name, :gender, :birth_date, :cellphone, :email, :apartment_id, :person_type
  belongs_to :apartment, optional: true

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

  form do |f|
    f.inputs do
      f.input :apartment
      f.input :person_type
    	f.input :name
      f.input :gender, as: :select
      f.input :birth_date, as: :datepicker,
                      datepicker_options: {
                        max_date: "-1D"
                      }
      f.input :cellphone
      f.input :email
    end
    f.actions
  end

end
