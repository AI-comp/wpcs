
FactoryGirl.define do

  factory :alice, class: User do
    uid 'alice'
    name 'Alice'
    email 'alice@wpcs.com'
    encrypted_password [*'a'..'z'].sample(10).join
  end

  factory :addition, class: Problem do
    title        'addition'
    description  'A+B=?'
    small_input  '1 1'
    small_output '2'
    large_input  '100 100'
    large_output '200'
    small_score  3
    large_score  1020
  end

end
