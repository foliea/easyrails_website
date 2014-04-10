ActiveAdmin.register Page do
  permit_params :name, :locale, :content, :title

  index do
    column :name
    column :locale
    column :created_at
    column :updated_at
    default_actions
  end

  form do |f|
    f.inputs "Page" do
      f.input :name
      f.input :locale
      f.input :title
      f.input :content
    end
    f.actions
  end
end
