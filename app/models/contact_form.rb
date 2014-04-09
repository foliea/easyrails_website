require 'tableless'

class ContactForm < SpecialModel::Tableless
  attr_accessor :email, :subject, :body

  validates :email, presence: true
end
