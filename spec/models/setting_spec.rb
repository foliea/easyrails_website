require 'spec_helper'

describe Setting do
  it { should validate_presence_of(:keyname) }
  it { should validate_presence_of(:value) }
  it { should validate_uniqueness_of(:keyname) }
  
  context 'after save'
    it 'reloads config'
    
    end
  end
end
