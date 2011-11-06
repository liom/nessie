require 'spec_helper'

describe Record::AAAA do
  before :each do
    @record = FactoryGirl.build(:record_aaaa)
  end
  
  it { should validate_presence_of(:content) }
  
  it { should have_immutable_field(:type, 'AAAA') }
  
  it "should allow valid IP address" do
    @record.content = 'fe80::1'
    @record.should be_valid
  end
  
  it "should disallow invalid IP address" do
    @record.content = '1.2.3.4'
    @record.should_not be_valid
  end
  
end
