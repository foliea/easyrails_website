FactoryGirl.define do
  factory :page do
    name 'MyTest_TestPage'
    locale 'en'

    factory :page_en do
    end

    factory :page_fr do
      locale 'fr'
    end

    factory :page_home do
      name 'home'
    end
  end
end
