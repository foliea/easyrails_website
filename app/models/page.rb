class Page < ActiveRecord::Base
  validates :name, uniqueness: { scope: :locale }
  validates :name, :locale, presence: true

  scope :by_name, lambda { |n| where(name: n) }

  def self.get_page args = {}
    self.where(name: args[:name], locale: args[:locale]).first
  end
end
