FactoryGirl.define do
  factory :domain do
    name Faker::Internet.domain_name
    type "MASTER"
  end
end
