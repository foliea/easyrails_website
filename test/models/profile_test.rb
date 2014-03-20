require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  should validate_presence_of(:user_id)
  should validate_uniqueness_of(:user_id)
  should belong_to(:user)

  test "valid with only mandatory fields" do
    p = profiles(:mandatory_fields)

    assert p.valid?, 'One field should not be validated'
  end

  test "valid with all attributes" do
    p = profiles(:adrien)

    assert p.valid?, 'Profile wasn\'t valid'
  end
end
