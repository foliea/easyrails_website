ActiveAdmin.register Mercury::Image do
  actions :all, except: :edit
  permit_params :image, :image_file_name

  form do |f|
    f.inputs "Page" do
      f.input :image, :required => false, :as => :file
    end
    f.actions
  end

  show do |s|
    attributes_table do
      row :image_file_name
      row :image_content_type
      row :image_file_size
      row :image_updated_at
      row :image do
        s.image.url(:medium)
      end
      row :image do
        image_tag(s.image.url(:medium))
      end
    end
   end
end
