include 'spec_helper'

describe User do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  
  context 'when already registered from a provider'
    it 'gets the user' do
      
    end
  end
  
  context 'when email from provider already exist'
    it 'gets the user' do
      
    end
  end
  
  context 'when registering from external provider'
    it 'creates a new user' do
      
    end
  end
  
  context 'before create'
    it 'creates a profile' do
      
    end
  end
  
  context 'when destroying'
    it 'destroys affiliated profile' do
      
    end
  end
  
  context 'when there is only one admin' do
    it "can't be destroy" do
      
    end
  end
end
