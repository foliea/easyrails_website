ActiveAdmin.register Mercury::Image do

  permit_params :image_file_name

  form do |f|
    f.inputs "Page" do
      f.input :image_file_name
    end
    f.actions
  end
end
