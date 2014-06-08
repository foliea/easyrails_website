ActiveAdmin.register Document do
  actions :all, except: :edit
  permit_params :document, :document_file_name

  show do |s|
    attributes_table do
      row :document_file_name
      row :document_content_type
      row :document_file_size
      row :document do
        s.document.url
      end
    end
  end

  form do |f|
    f.inputs 'Document' do
      FileInput.upload(f, 'document')
    end
    f.actions
  end
end
