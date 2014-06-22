class Image < ActiveRecord::Base
  has_attached_file :image, styles: { medium: '300x300>', thumb: '100x100>' },
                            path: ':rails_root/public/system/:attachment/:id/:style/:filename',
                            url: '/system/:attachment/:id/:style/:filename'

  delegate :url, to: :image

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_attachment_size :image, less_than: 5.megabytes
  validates_attachment :image, presence: true

  def serializable_hash(options = {})
    options.fetch(:methods) { [] } << :url
    super(options)
  end
end
