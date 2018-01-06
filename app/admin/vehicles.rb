ActiveAdmin.register Vehicle do
	require 'net/http'
	require 'json'
	permit_params :vehicle_model
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
	  url = "http://fipeapi.appspot.com/api/1/carros/marcas.json"
		uri = URI(url)
		response = Net::HTTP.get(uri)
		@marcas = JSON.parse(response)

    f.inputs do
      f.input :vehicle_model, as: :select, collection: @marcas.map {|m| m['name'] }
    end
    f.inputs 'Details' do
      f.input :person,
        as: :string,
        input_html: {
          class: 'autocomplete',
          id: 'person_name',
          name: '',
          value: f.object.vehicle_color.try(:name),
          data: {
            url: autocomplete_admin_people_path,
            hidden_input: '#license_plate',
          },
        }

      f.input :license_plate
    end

    f.actions
  end

end
