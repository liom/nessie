# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :a_record do
    association   :domain
    name          "www"
    address       "1.2.3.4"
  end
end
