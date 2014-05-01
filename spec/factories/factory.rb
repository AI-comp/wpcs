
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
    problems { |c| c.problems = FactoryGirl.create_list(:problem, 22) }
    after(:create) do |c, evaluator|
      c.problems.each { |p| p.save } if evaluator.save_problems
      # FIXME: (>_<)
      edges = [
        [1,3,6],
        [2],
        [9],
        [4],
        [7,5],
        [9],
        [7],
        [8],
        [9],
        [10,12,15],
        [11],
        [21],
        [13,18],
        [14],
        [21],
        [16],
        [17],
        [18],
        [19],
        [20],
        [21],
        []
      ]

      edges.each_with_index do |es,i|
        es.each { |e| ProblemEdge.create(from_problem_id: i+1, to_problem_id: e+1).save! }
      end
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
    sequence(:x)            {|n| [nil, 45, 210, 430, 153, 261, 369, 261, 369, 477, 585, 800, 1017, 750, 909, 1080, 680, 780, 880, 950, 1050, 1150, 1233][n] }
    sequence(:y)            {|n| [nil, 295, 127, 127, 295, 252, 252, 414, 414, 393, 252, 60, 60, 252, 184, 184, 420, 440, 420, 330, 330, 300, 184][n] }
  end

  factory :image

  factory :group do
    sequence(:name) {|n| "group_#{n}" }
  end

end
