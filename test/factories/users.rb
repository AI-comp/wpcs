FactoryGirl.define do
  factory :user do
    provider "Factory"
    uid { Faker::Name.first_name }
    name { uid }
  end
end
