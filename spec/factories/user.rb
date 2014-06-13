FactoryGirl.define do
  factory :user do
    email 'test@example.com'
    password 'password2013'
    password_confirmation 'password2013'

    factory :user_error do
      password ''
    end
    factory :user_twitter do
      provider 'twitter'
      uid '42'
    end

    factory :user_admin do
      email 'admin@example.com'
      admin true

      factory :user_another_admin do
        email 'another@example.com'
      end
    end
  end
end
