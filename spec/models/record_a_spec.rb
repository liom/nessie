require 'spec_helper'

describe RecordA do
  before :each do
    @record = FactoryGirl.build(:record_a)
  end
  
  it { should validate_presence_of(:content) }
  
  it "should not be able to change record type" do
    @record.type.should == 'A'
    @record.type = 'MX'
    @record.type.should == 'A'
  end
  
  it "should allow valid IP address" do
    @record.content = '1.2.3.4'
    @record.should be_valid
  end
  
  it "should disallow invalid IP address" do
    @record.content = '1.2.3.256'
    @record.should_not be_valid
  end
  
end
