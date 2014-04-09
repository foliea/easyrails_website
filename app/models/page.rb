class Page < ActiveRecord::Base
  validates :name, uniqueness: { scope: :locale }
  validates :name, :locale, presence: true

  def self.get_page args = {}
    self.where(name: args[:name], locale: args[:locale]).first
  end
end
