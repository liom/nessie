FactoryGirl.define do
  factory :record_ns, :parent => :record, :class => Record::NS do
    content "ns.example.org"
  end
end
