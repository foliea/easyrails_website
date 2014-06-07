FactoryGirl.define do
  factory :user do
    email 'test@example.com'
    password 'password2013'
#    sequence(:id) { |i| i }
  end
end
