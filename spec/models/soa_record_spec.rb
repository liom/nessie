require 'spec_helper'

describe SoaRecord do
  before :each do
    @record = FactoryGirl.build(:soa_record)
  end
  
  it { should validate_presence_of(:hostmaster) }
  it { should validate_presence_of(:serial) }
  it { should validate_presence_of(:slave_refresh) }
  it { should validate_presence_of(:slave_retry) }
  it { should validate_presence_of(:transfer_expire) }
  it { should validate_presence_of(:default_ttl) }

  it { should validate_numericality_of(:serial) }
  it { should validate_numericality_of(:slave_refresh) }
  it { should validate_numericality_of(:slave_retry) }
  it { should validate_numericality_of(:transfer_expire) }
  it { should validate_numericality_of(:default_ttl) }
end
