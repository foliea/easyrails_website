require 'spec_helper'

describe Page do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:locale) }
  it { should validate_uniqueness_of(:name).scoped_to(:locale) }

  let(:page_en) { FactoryGirl.create(:page_en) }

  it 'is valid' do
    page = FactoryGirl.build(:page)
    expect(page).to be_valid
  end

  it 'is saved' do
    expect(page_en).to be_persisted
  end

  context 'before save' do
    it 'parameterize the name' do
      page = FactoryGirl.build(:page)
      parameterize_name = page.name.parameterize

      page.save
      expect(page.name).to eq(parameterize_name)
    end
  end

  context 'when current locale exist' do
    it 'gets language by name from current locale' do
      page = Page.from_name!(page_en.name, 'en', 'fr')
      expect(page.locale).to eq('en')
    end
  end

  context "when current locale doesn't exist" do
    it 'gets language by name from default locale' do
      FactoryGirl.create(:page_fr)
      page = Page.from_name!(page_en.name, 'es', 'fr')

      expect(page.locale).to eq('fr')
    end
  end

  context "when default locale doesn't exist" do
    it 'gets first existant language with name' do
      page = Page.from_name!(page_en.name, 'es', 'it')

      expect(page.name).to eq(page_en.name)
    end
  end

  context "when page doesn't exist" do
    it 'throws an error' do
      expect { Page.from_name!('unknown') }.to raise_error
    end
  end

  # For future update
  context 'when language is locked' do
    it "can't be destroy" do
      
    end
  end

  # For future update
  context 'when destroying a page bind to menu' do
    it "can't be destroy" do

    end
  end
end
