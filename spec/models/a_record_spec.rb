require 'spec_helper'

describe ARecord do
  before :each do
    @record = FactoryGirl.build(:a_record)
  end
  
  it { should validate_presence_of(:address) }
  
  it "should allow valid IP address" do
    @record.address = '1.2.3.4'
    @record.should be_valid
  end
  
  it "should disallow invalid IP address" do
    @record.address = '1.2.3.256'
    @record.should_not be_valid
  end

end
