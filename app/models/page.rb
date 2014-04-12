class Page < ActiveRecord::Base
  before_save :parameterize_name

  validates :name, uniqueness: { scope: :locale }
  validates :name, :locale, presence: true

  scope :by_name, lambda { |name| where(name: name) }

  def self.get_page_with_locale name, locale
    self.find_by(name: name, locale: locale)
  end

  def self.get_page! name
    self.find_by!(name: name)
  end

  def commentable?
    commentable.present?
  end

  protected

  def parameterize_name
    self.name = name.parameterize
  end
end
