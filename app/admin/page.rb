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
      f.input :content, as: :hidden
    end
    f.actions
    # Faire un decorator
    f.form_buffers.last << content_tag(:div, f.object.content, id: 'html-editor', style: 'height:400px;margin-top:20px;border:1px solid #DDD;border-radius:4px;')

  end
end
