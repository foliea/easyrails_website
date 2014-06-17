require 'spec_helper'

feature 'Account sign in' do
  include Support::Authentication

  let!(:user) { FactoryGirl.create(:user) }

  context 'when user exist' do
    scenario 'displays success notice' do
      sign_in(:user)
      msg = I18n.t('devise.sessions.signed_in')

      expect(page.has_content?(msg)).to be true
    end
  end

  context "when user doesn't exist" do
    scenario 'displays invalid alert' do
      sign_in(:user_error)
      msg = I18n.t('devise.failure.invalid')

      expect(page.has_content?(msg)).to be true
    end
  end
end
