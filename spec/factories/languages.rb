FactoryGirl.define do
  factory :language do
    name 'language'
    sequence(:code) { |i| "code#{i}" }
    default false

    factory :language_mandatory do
      default nil
    end
  end
end
