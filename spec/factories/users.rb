FactoryGirl.define do
  factory :user, aliases: [:anthony] do
    name      'Anthony'
    email     { "#{name}@jdr.com" }
    password  'IAmGay'
    language  'fr'
  end
end
