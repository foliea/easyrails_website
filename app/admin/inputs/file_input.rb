class FileInput < Formtastic::Inputs::FileInput
  def self.upload(f, type)
    f.input "#{type}_file_name"
    f.input "#{type}", required: false, as: :file, label: 'Upload'
  end
end
