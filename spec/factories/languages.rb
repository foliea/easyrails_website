FactoryGirl.define do
  factory :language do
    name 'language'
    locale 'en'
    default false

    factory :default_language do
      default true

      factory :old_default_language do
        locale 'fr'
      end
    end
  end
end
