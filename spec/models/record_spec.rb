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
      @record = FactoryGirl.build :record, :type => 'A'
    end

    it "should be valid" do
      @record.should be_valid
    end

    it "should not be valid without a domain" do
      @record.domain = nil
      @record.should_not be_valid
    end
    
    # it "should update domain's timestamp after save" do
    #   record = FactoryGirl.create(:record_a)
    #   lambda { sleep 1; record.touch }.should change(record.domain, :updated_at).by_at_least(1.second)
    # end
    
  end
  
  describe "name" do
    it "should have fqdn if empty" do
      domain = FactoryGirl.create(:domain, :name => 'example.com')
      record = FactoryGirl.create(:record, :type => 'A', :domain => domain)
      record.name.should == 'example.com'
    end
    
    it "should have fqdn if relative was given" do
      domain = FactoryGirl.create(:domain, :name => 'example.com')
      record = FactoryGirl.create(:record, :type => 'A', :domain => domain, :name => 'www')
      record.name.should == 'www.example.com'
    end

    it "should not have dot in the name as last symbol" do
      domain = FactoryGirl.create(:domain, :name => 'example.com')
      record = FactoryGirl.create(:record, :type => 'A', :domain => domain, :name => 'www.example.com.')
      record.name.should == 'www.example.com'
    end
    
  end
  
end
