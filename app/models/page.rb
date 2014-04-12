class Page < ActiveRecord::Base
  before_save :parameterize_name

  validates :name, uniqueness: { scope: :locale }
  validates :name, :locale, presence: true

  scope :by_name, lambda { |name| where(name: name) }

  def self.get_page! name
    page ||= self.find_by(name: name, locale: I18n.locale)
    page ||= self.find_by(name: name, locale: I18n.default_locale)
    page ||= self.find_by!(name: name)
  end

  def commentable?
    commentable.present?
  end

  protected

  def parameterize_name
    self.name = name.parameterize
  end
end
