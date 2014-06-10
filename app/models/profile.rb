class Profile < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true

  has_attached_file :avatar, styles: { medium: '300x300>' }

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_attachment_size :avatar, less_than: 2.megabytes
end
