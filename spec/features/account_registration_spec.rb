require 'spec_helper'

feature 'Account registration' do
  include Support::Authentication

  context 'when user is valid' do
    scenario 'redirects to root' do
      register(:user)
      expect(current_path).to eq(root_path)
    end

    scenario 'displays success notice' do
      register(:user)
      msg = I18n.t('devise.registrations.signed_up')

      expect(page.has_content?(msg)).to be true
    end
  end

  context 'when user is invalid' do
    scenario 'redirects to user registration' do
      register(:user_error)
      expect(current_path).to eq(user_registration_path)
    end
  end
end
