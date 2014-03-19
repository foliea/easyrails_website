require 'test_helper'

class LanguageTest < ActiveSupport::TestCase
  test "invalid without a name" do
    l = languages(:fr)
    l.name = nil
    assert !l.valid?, 'Name is not being validated'
  end

  test "invalid without a code" do
    l = languages(:fr)
    l.code = nil
    assert !l.valid?, 'Code is not being validated'
  end

  test "invalid if code already exist" do
    l_fr = languages(:fr)
    l_en = languages(:en)
    l_en.code = l_fr.code

    assert !l_en.valid?, 'Uniqueness of Code is not being validated'
  end

  test "valid without default" do
    l = languages(:fr)
    l.default = nil

    assert l.valid?, 'Language wasn\'t valid without default'
  end

  test "valid with all attributes" do
    l = languages(:fr)

    assert l.valid?, 'Language wasn\'t valid'
  end
end
