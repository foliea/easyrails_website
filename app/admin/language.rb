ActiveAdmin.register Language do

  permit_params :name, :locale, :default

  form do |f|
    f.inputs 'Language' do
      f.input :name
      f.input :locale
      f.input :default if f.object.default.blank?
    end
    f.actions
  end
end
