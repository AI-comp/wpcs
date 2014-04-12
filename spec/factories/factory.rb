
FactoryGirl.define do

  factory :user do

    trait :alice do
      sequence(:uid) {|n| "alice_#{n}" }
      sequence(:name) {|n| "Alice the " + n.ordinalize }
      email 'alice@wpcs.com'
      is_admin false

      after(:create) do |u|
        Group.offset( (1...Group.count).to_a.sample ).first.users.push(u)
      end
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
    ignore do
      save_problems false
    end

    name 'WUPC'
    introduction 'Waseda University Programming Contest'
    start_time Time.now
    end_time Time.new(2114, 6, 2, 16, 0, 0)
    problems { |c| c.problems = FactoryGirl.create_list(:problem, 15) }
    after(:create) do |c, evaluator|
      c.problems.each { |p| p.save } if evaluator.save_problems
    end
  end

  factory :problem, class: Problem do
    sequence(:title)        {|n| "addition_#{n}" }
    description             'A+B=?'
    sequence(:small_input)  {|n| "1 #{n}" }
    sequence(:small_output) {|n| (1+n).to_s }
    sequence(:large_input)  {|n| "100 #{n}" }
    sequence(:large_output) {|n| (100+n).to_s }
    small_score             3
    large_score             1020
    x                       Random.rand(800)
    y                       Random.rand(600)
  end

  factory :image

  factory :group do
    sequence(:name) {|n| "group_#{n}" }
  end

end
