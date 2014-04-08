ActiveAdmin.register Setting do
  actions :all, except: [:new, :destroy]

  form do |f|
    f.inputs "Setting details" do
      f.input :value
      f.input :name
      f.input :description
    end
    f.actions
  end

  permit_params :value, :name, :description

end
