FactoryGirl.define do
  factory :language do
    name 'language'
    locale 'en'
    default false

    factory :default_language do
      default true

      factory :new_default_language do
      end
    end
  end
end
