require 'spec_helper'

feature 'Account registration' do

  let!(:page_home) { FactoryGirl.create(:page_home) }

  scenario 'is valid' do
    register('test_registration@example.com', 'password1234', 'password1234')
    expect(root_path).to eq(current_path)
  end

  scenario 'is invalid' do
    register('test_registration@example.com', 'password1234', '')
    expect(user_registration_path).to eq(current_path)
  end

  def register(email, password, password_confirmation)
    visit new_user_registration_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password Confirmation', with: password_confirmation
    click_button 'register'
  end
end
