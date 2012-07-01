require 'spec_helper'

describe AaaaRecord do
  before :each do
    @record = FactoryGirl.build(:aaaa_record)
  end
  
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:name) }
  
  it "should allow valid IP address" do
    @record.address = 'fe80::1'
    @record.should be_valid
  end
  
  it "should disallow invalid IP address" do
    @record.address = 'zz::zz'
    @record.should_not be_valid
  end

end
