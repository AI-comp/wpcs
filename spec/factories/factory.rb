
FactoryGirl.define do

  factory :user do

    trait :alice do
      sequence(:uid) {|n| "alice_#{n}" }
      name 'Alice'
      email 'alice@wpcs.com'
      is_admin false
    end

    trait :bob do
      sequence(:uid) {|n| "bob_#{n}" }
      name 'Bob'
      email 'bob@wpcs.com'
      is_admin true
    end

    encrypted_password [*'a'..'z'].sample(10).join
    salt [*'a'..'z'].sample(10).join

    factory :contestant, traits: [:alice]
    factory :admin, traits: [:bob]

  end

  factory :contest, class: Contest do
    name 'WUPC'
    introduction 'Waseda University Programming Contest'
    start_time Time.new(2012, 6, 2, 14, 0, 0)
    end_time Time.new(2012, 6, 2, 16, 0, 0)
    problems { FactoryGirl.create_list(:problem, 1) }
  end

  factory :problem, class: Problem do
    title        'addition'
    description  'A+B=?'
    small_input  '1 1'
    small_output '2'
    large_input  '100 100'
    large_output '200'
    small_score  3
    large_score  1020
  end

  factory :image

  factory :group do
    sequence(:name) {|n| "group_#{n}" }
  end

end
