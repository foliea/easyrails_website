require 'spec_helper'

describe Language do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:code) }
  it { should validate_uniqueness_of(:code) }

  context 'with only mandatory fields' do
    it 'is valid' do
      language = FactoryGirl.build(:language_mandatory)
      expect(language).to be_valid
    end
  end

  context 'with all attributes' do
    it 'is valid' do
      language = FactoryGirl.build(:language)
      expect(language).to be_valid
    end
  end
  
  context 'when updating language to default' do
    it 'set others language default to false' do
    end
  end
  
  context 'when updating default language as not default' do
    it 'fallbacks' do
    end
  end
  
  context 'when destroying default language' do
    it 'must not be destroy' do
    end
  end
end
