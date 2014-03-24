require 'spec_helper'

describe Language do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:code) }
  it { should validate_uniqueness_of(:code) }

  describe "is valid" do
    it "with only mandatory fields" do
      language = FactoryGirl.build(:language_mandatory)
      language.should be_valid
    end

    it "with all attributes" do
      language = FactoryGirl.build(:language)
      language.should be_valid
    end
  end
end
