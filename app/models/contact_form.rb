class ContactForm
  include WithoutDatabase

  attr_accessor :email, :subject, :body
  validates :email, presence: true
end
