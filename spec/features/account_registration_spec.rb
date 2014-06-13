require 'spec_helper'

feature 'Account registration' do

  let!(:page_home) { FactoryGirl.create(:page_home) }

  scenario 'is valid' do
    register(:user)
    expect(root_path).to eq(current_path)
  end

  scenario 'is invalid' do
    register(:user_error)
    expect(user_registration_path).to eq(current_path)
  end

  def register(user_factory_name)
    visit new_user_registration_path

    fill_form(:user, attributes_for(user_factory_name))
    submit(:user)
  end
end
