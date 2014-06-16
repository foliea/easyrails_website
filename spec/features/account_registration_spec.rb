require 'spec_helper'

feature 'Account registration' do
  include Support::Authentication

  scenario 'succeed when user is valid' do
    register(:user)
    expect(current_path).to eq(root_path)
  end

  scenario 'failed when user is invalid' do
    register(:user_error)
    expect(current_path).to eq(user_registration_path)
  end
end
