require 'spec_helper'

describe RecordA do
  it { should validate_presence_of(:content) }
  it "should not be able to change record type" do
    a = FactoryGirl.build(:record_a)
    a.type.should == 'A'
    a.type = 'MX'
    a.type.should == 'A'
  end
end
