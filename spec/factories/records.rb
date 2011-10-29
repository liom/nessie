FactoryGirl.define do
  factory :record do
    association :domain
  end
  
  factory :record_a, :parent => :record, :class => RecordA do

  end
    
  
end
