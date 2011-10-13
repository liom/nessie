require 'spec_helper'

describe Domain do
  # Domain name. Required.
  # Example: example.com
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  
  # Domain type. One of MASTER, SLAVE, NATIVE. Required.
  it { should validate_presence_of(:type) }
  it { should allow_value('MASTER').for(:type) }
  it { should allow_value('SLAVE').for(:type) }
  it { should allow_value('NATIVE').for(:type) }
  it { should_not allow_value("test").for(:type) }

end
