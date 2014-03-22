require 'test_helper'

class LanguageTest < ActiveSupport::TestCase
  should validate_presence_of(:name)
  should validate_presence_of(:code)
  should validate_uniqueness_of(:code)

  test "valid with only mandatory fields" do
    l = FactoryGirl.build(:language_mandatory)
    assert l.valid?, 'One field should not be validated'
  end

  test "valid with all attributes" do
    l = FactoryGirl.build(:language)
    binding.pry
    assert l.valid?, 'Language wasn\'t valid'
  end
end
