FactoryGirl.define do
  factory :record_a, :parent => :record, :class => Record::A do
    content "1.2.3.4"
  end
end
