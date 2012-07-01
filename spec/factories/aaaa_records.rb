# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :aaaa_record do
    association   :domain
    name          "www"
    address       "2001:0db8:0000:0000:0008:0800:200c:417a"
  end
end
