FactoryGirl.define do
  factory :record_soa, :parent => :record, :class => Record::SOA do
    content "ns.daemons.org.ua hostmaster@daemons.org.ua 2009062411 3600 900 604800 3600"
  end
end
