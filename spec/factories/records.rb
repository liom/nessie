FactoryGirl.define do
  factory :record do
    association :domain
    type 'A'
  end
  
  factory :record_a, :parent => :record, :class => Record::A do

  end
    
  
end
