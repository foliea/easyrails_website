require 'spec_helper'

describe Page do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:locale) }
  it { should validate_uniqueness_of(:name).scoped_to(:locale) }
  
  context 'before save' do
    it 'parameterize the name' do
      
    end
  end
  
  context 'when current locale exist' do
    it 'gets language by name from current locale'
    
    end
  end
  
  context "when current locale doesn't exist" do
    it 'gets language by name from default locale'
    
    end
  end
  
  context "when default locale doesn't exist" do
    it 'gets first existant language with name'
    
    end
  end
  
  context 'when language is locked' do
    it "can't be destroy" do
      
    end
  end
end
