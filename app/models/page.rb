class Page < ActiveRecord::Base
  before_save :parameterize_name

  validates :name, uniqueness: { scope: :locale }
  validates :name, :locale, presence: true

  scope :by_name, ->(name) { where(name: name) }

  def self.get_by_name!(name)
    page ||= find_by(name: name, locale: I18n.locale)
    page ||= find_by(name: name, locale: I18n.default_locale)
    page || self.find_by!(name: name)
  end

  protected

  def parameterize_name
    self.name = name.parameterize
  end
end
