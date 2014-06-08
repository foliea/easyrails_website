require 'spec_helper'

describe Profile do
  it { should validate_presence_of(:user) }

  it { should have_attached_file(:avatar) }
  # it { should validate_attachment_content_type(:avatar).
  #              allowing('image/png', 'image/gif', 'image.jpg').
  #              rejecting('text/plain', 'text/xml') }
  it do
    should validate_attachment_size(:avatar).
      less_than(2.megabytes)
  end

  it 'is valid' do
    profile = FactoryGirl.build(:profile)
    expect(profile).to be_valid
  end
end
