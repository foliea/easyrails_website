require 'spec_helper'

describe User do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it 'is valid' do

  end

  it 'is saved' do

  end

  context 'when already registered from a provider' do
    it 'gets the user' do

    end
  end

  context 'when email from provider already exist' do
    it 'gets the user' do

    end
  end

  context 'when registering from external provider' do
    it 'creates a new user' do

    end
  end

  context 'before create' do
    it 'creates a profile' do

    end
  end

  context 'when destroying' do
    it 'destroys affiliated profile' do

    end
  end

  context 'when there is only one admin' do
    it "can't be destroy" do

    end
  end
end
