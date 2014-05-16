ActiveAdmin.register Image do
  actions :all, except: :edit
  permit_params :image, :image_file_name

  index do
    column :image_file_name
    column :image_content_type
    column :image_file_size
    column :created_at
    column :updated_at
    actions 
  end

  show do |s|
    attributes_table do
      row :image_file_name
      row :image_content_type
      row :image_file_size
      row :image do
        s.image.url(:medium)
      end
      row :image do
        image_tag(s.image.url(:medium))
      end
    end
   end

  form do |f|
    f.inputs 'Image' do
      f.input :image_file_name
      f.input :image, required: false, as: :file, label: 'Upload'
    end
    f.actions
  end
end
