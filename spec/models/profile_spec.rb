require 'spec_helper'

describe Profile do
  it { should validate_presence_of(:user) }
  it { should validate_uniqueness_of(:user) }
end
