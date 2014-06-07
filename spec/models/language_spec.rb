require 'spec_helper'

describe Language do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:locale) }
  it { should validate_uniqueness_of(:locale) }

  it 'is valid' do
    language = FactoryGirl.build(:language)
    expect(language).to be_valid
  end

  it 'is saved' do
    language = FactoryGirl.create(:language)
    expect(:language).not_to be_nil
  end

  # Included from has_default behavior
  context 'when saving language to default' do
    it 'sets existing languages default to false' do
      default_language     = FactoryGirl.create(:default_language)
      new_default_language = FactoryGirl.create(:default_language)

      default_language.reload
      expect(default_language.default).to be_false
    end

    it 'sets language default to true' do
      language = FactoryGirl.create(:default_language)
      expect(language.default).to be_true
    end
  end

  context 'when updating default language as not default' do
    it 'fallbacks' do
      language = FactoryGirl.create(:default_language)
      language.default = false
      language.save
      expect(language.default).to be_true
    end
  end

  context 'when destroying default language' do
    it 'must not be destroy' do
      language = FactoryGirl.create(:default_language)
      language.destroy
      expect(language).not_to be_nil
    end
  end
end
