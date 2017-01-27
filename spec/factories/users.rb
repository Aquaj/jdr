FactoryGirl.define do
  factory :user do
    email     { "#{name}@jdr.com" }

    factory :anthony do
      name      'Anthony'
      password  'IAmGay'
      language  'fr'
    end

    factory :jeremie do
      name      'Jérémie'
      password  'IamMJ'
      language  'fr'
    end
  end
end
