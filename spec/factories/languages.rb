FactoryGirl.define do
  factory :language do
    name 'language'
    sequence(:locale) { |i| "locale#{i}" }
    default false

    factory :default_language do
      default true
    end
  end
end
