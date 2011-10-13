require 'spec_helper'

describe Domain do

  # Domain name. Required.
  # Example: example.com
  describe "name" do
    before do
      FactoryGirl.create(:domain)
    end
    it { should validate_presence_of(:name) }
    it "should be unique" do
      should validate_uniqueness_of(:name)
    end
  end
  
  # Domain type. One of MASTER, SLAVE, NATIVE. Required.
  it { should validate_presence_of(:type) }
  Domain::ALLOWED_TYPES.each do |type|
    it { should allow_value(type).for(:type) }
  end
  it { should_not allow_value("test").for(:type) }

end
