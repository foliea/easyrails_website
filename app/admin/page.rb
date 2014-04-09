ActiveAdmin.register Page do
  permit_params :name, :locale, :content

  index do
    column :name
    column :locale
    column :created_at
    column :updated_at
    default_actions
  end

end
