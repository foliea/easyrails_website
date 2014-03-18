class Profile < ActiveRecord::Base
  belongs_to  :user

  validates :user_id, presence: true,
                      uniqueness: true

  # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :avatar, styles: {
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
