class ContactForm
  include WithoutDatabase

  attr_accessor :name, :status
  validates :name, presence: true
end
