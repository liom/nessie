FactoryGirl.define do
  factory :record_aaaa, :parent => :record, :class => Record::AAAA do
    content "2001:0db8:0000:0000:0008:0800:200c:417a"
  end
end
