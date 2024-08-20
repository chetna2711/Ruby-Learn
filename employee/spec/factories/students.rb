

FactoryBot.define do
  factory :student do
    first_name { Faker::Name.name_with_middle }
    last_name { Faker::Name.name_with_middle }
    email { Faker::Internet.email }
    contact_no { Faker::Number.number(digits: 10) }
    country { Student.country_code_list.sample }
    state { 'Gujarat' }
    city { 'Surat' }
  end
end
