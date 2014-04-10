class Mercury::Image < ActiveRecord::Base

  self.table_name = :mercury_images

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" },
        path: ":rails_root/public/system/:attachment/:id/:style/:filename",
        url: "/system/:attachment/:id/:style/:filename"

  delegate :url, to: :image

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_attachment_size :image, less_than: 5.megabytes

  def serializable_hash(options = nil)
    options ||= {}
    options[:methods] ||= []
    options[:methods] << :url
    super(options)
  end

end
