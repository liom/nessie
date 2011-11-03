require 'spec_helper'

describe Record do
  it { should validate_presence_of(:type) }
  Record::ALLOWED_TYPES.each do |type|
    it { should allow_value(type).for(:type) }
  end
  it { should_not allow_value("test").for(:type) }
  
  it { should belong_to(:domain) }
  
  describe "with domain" do

    before(:each) do
      @record = FactoryGirl.build :record, :domain => nil, :type => 'A'
    end

    it "should not be valid without a domain" do
      @record.should_not be_valid
    end

    it "should require domain_id, not just a domain object" do
      domain = FactoryGirl.build(:domain)
      @record.domain = domain
      @record.should_not be_valid
    end
    
    it "should be ok with domain" do
      domain = FactoryGirl.create(:domain)
      @record.domain = domain
      @record.should be_valid
    end
  end
  
end
