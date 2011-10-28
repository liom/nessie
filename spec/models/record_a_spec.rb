require 'spec_helper'

describe RecordA do
  it { should validate_presence_of(:content) }
  
end
