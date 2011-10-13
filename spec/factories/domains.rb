FactoryGirl.define do
  factory :domain do
    name { Faker::Internet.domain_name }
    type { Domain::ALLOWED_TYPES.sample }
  end
end
