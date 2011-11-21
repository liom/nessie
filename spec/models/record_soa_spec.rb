require 'spec_helper'

describe Record::SOA do
  before :each do
    @record = FactoryGirl.build(:record_soa)
  end
  
  it { should validate_presence_of(:content) }
  
  it { should have_immutable_field(:type, 'SOA') }
  
  %w(primary_ns hostmaster serial slave_refresh slave_retry transfer_expire default_ttl).each do |field|
    it { @record.should respond_to(field.to_sym) }
  end
  
  # it { should validate_presence_of(:primary_ns) }
  # it { should validate_presence_of(:hostmaster) }

  # it { should validate_numericality_of(:serial) }
  # it { should validate_numericality_of(:slave_refresh) }
  # it { should validate_numericality_of(:slave_retry) }
  # it { should validate_numericality_of(:transfer_expire) }
  # it { should validate_numericality_of(:default_ttl) }
  
end
