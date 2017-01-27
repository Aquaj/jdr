FactoryGirl.define do
  factory :user do
    email     { "#{name}@jdr.com" }

    factory :anthony, class: :user do
      name      'Anthony'
      password  'IAmGay'
      language  'fr'
    end

    factory :jeremie, class: :user do
      name      'Jérémie'
      password  'IamMJ'
      language  'fr'
    end
  end
end
