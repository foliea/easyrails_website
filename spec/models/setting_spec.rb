require 'spec_helper'

describe Setting do
  it { should validate_presence_of(:keyname) }
  it { should validate_presence_of(:value) }
  it { should validate_uniqueness_of(:keyname) }

  it 'is valid' do
    setting = FactoryGirl.build(:setting)
    expect(setting).to be_valid
  end

  it 'is saved' do
    setting = FactoryGirl.create(:setting)
    expect(setting).to be_persisted
  end

  context 'after save' do
    it 'reloads config' do
      Setting.any_instance.expects(:reload)
      FactoryGirl.create(:setting)
    end
  end
end
