require 'test_helper'

class ProfileTest < ActiveSupport::TestCase

  test "invalid without user" do
    p = profiles(:adrien)
    p.user_id = nil

    assert !p.valid?, 'User is not being validated'
  end

  test "invalid if user is already link" do
    p_adrien = profiles(:adrien)
    p_lola = profiles(:lola)
    p_lola.user_id = p_adrien.user_id

    assert !p_lola.valid?, 'Uniqueness of user_id is not being validated'
  end

  test "valid with only mandatory fields" do
    p = profiles(:mandatory_fields)

    assert p.valid?, 'One field should not be validated'
  end

  test "valid with all attributes" do
    p = profiles(:adrien)

    assert p.valid?, 'Profile wasn\'t valid'
  end
end
