ActiveAdmin.register Setting do
  actions :all, except: [:new, :destroy]
  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :value, :name, :description
  
  form do |f|
    f.inputs "Setting details" do
      f.input :value
      f.input :name
      f.input :description
    end
    f.actions
  end
  
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
