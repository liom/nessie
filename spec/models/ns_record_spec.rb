require 'spec_helper'

describe NsRecord do
  before :each do
    @record = FactoryGirl.build(:ns_record)
  end
  
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:name) }
  
  it "should allow valid domain name" do
    @record.address = 'ns.google.com.'
    @record.should be_valid
  end
  
  it "should disallow invalid domain name" do
    @record.address = '1.2.3.4'
    @record.should_not be_valid
  end

  it "should end with dot" do
    @record.address = 'ns.example.org'
    @record.should_not be_valid
  end

end
