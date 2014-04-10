class Page < ActiveRecord::Base
  validates :name, uniqueness: { scope: :locale }
  validates :name, :locale, presence: true

  scope :by_name, lambda { |n| where(name: n) }

  def self.get_page name, locale
    self.where(name: name, locale: locale).first
  end
end
