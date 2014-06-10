require 'spec_helper'

describe User do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it 'is valid' do
    user = FactoryGirl.build(:user)
    expect(user).to be_valid
  end

  it 'is saved' do
    user = FactoryGirl.create(:user)
    expect(user).to be_persisted
  end

  context 'when already registered from a provider' do
    it 'gets the user from provider' do
      user = FactoryGirl.create(:user_twitter)
      user_got = User.get_from_oauth(user.provider, user.uid, nil)
      expect(user_got.id).to eq(user.id)
    end
  end

  context 'when email from provider already exist' do
    it 'gets the user from email' do
      user = FactoryGirl.create(:user)
      user_got = User.get_from_oauth('twitter', '1', user.email)
      expect(user_got.id).to eq(user.id)
    end
  end

  context "when user from provider doesn't exist" do
    it 'creates a new user with temporary email' do
      user = User.get_from_oauth('twitter', '1', nil)
      expect(user.email).to match(User::TEMP_EMAIL_REGEX)
    end
  end

  context 'before create' do
    it 'creates a profile' do
      user = FactoryGirl.create(:user)
      expect(user.profile).to be_persisted
    end
  end

  context 'when destroying' do
    it 'destroys affiliated profile' do
      user = FactoryGirl.create(:user)
      profile = user.profile

      user.destroy
      expect(profile).not_to be_persisted
    end
  end

  context 'when there is only one admin' do
    it 'is last admin' do
      user = FactoryGirl.create(:user_admin)
      FactoryGirl.create(:user)

      expect(user).to be_last_admin
    end

    it "can't be destroy" do
      user = FactoryGirl.create(:user_admin)

      user.destroy
      expect(user).to be_persisted
    end

    it "can't be set as not admin" do
      user = FactoryGirl.create(:user_admin)

      user.admin = false
      user.save
      user.reload
      expect(user.admin).to be_true
    end
  end

  context 'when there is two or more admins' do
    it "isn't last admin" do
      user = FactoryGirl.create(:user_admin)
      FactoryGirl.create(:user_another_admin)

      expect(user).not_to be_last_admin
    end
  end
end
