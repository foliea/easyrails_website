class Document < ActiveRecord::Base

  has_attached_file :document

  validates_attachment_content_type :document, content_type: ['application/pdf', 'application/msword']
  validates_attachment_size :document, less_than: 20.megabytes
  validates_attachment :document, presence: true
end
