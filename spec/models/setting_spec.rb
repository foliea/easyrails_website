require 'spec_helper'

describe Setting do
  it { should validate_presence_of(:keyname) }
  it { should validate_presence_of(:value) }
  it { should validate_uniqueness_of(:keyname) }

  it 'is valid' do

  end

  it 'is saved' do

  end

  context 'after save' do
    it 'reloads config' do

    end
  end
end
