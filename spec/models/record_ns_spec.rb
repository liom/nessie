require 'spec_helper'

describe Record::NS do
  before :each do
    @record = FactoryGirl.build(:record_ns)
  end
  
  it { should validate_presence_of(:content) }
  
  it { should have_immutable_field(:type, 'NS') }
  
  it "should allow valid domain name" do
    @record.content = 'ns.google.com'
    @record.should be_valid
  end
  
  it "should disallow invalid domain name" do
    @record.content = '1.2.3.4'
    @record.should_not be_valid
  end

  it "should not end with dot" do
    @record.content = 'ns.example.org.'
    @record.should_not be_valid
  end


end
