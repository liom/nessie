# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ns_record do
    association   :domain
    name          "ns1"
    address       "ns.example.org."
  end
end
