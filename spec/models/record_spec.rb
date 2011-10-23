require 'spec_helper'

describe Record do
  it { should validate_presence_of(:type) }
  Record::ALLOWED_TYPES.each do |type|
    it { should allow_value(type).for(:type) }
  end
  it { should_not allow_value("test").for(:type) }
  
  it { should belong_to(:domain) }
  
end
