FactoryBot.define do
  factory :student do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { 'password123' }
    password_confirmation { 'password123' } 
    birthdate { "2000-01-01" }
    contact_no { Faker::Number.number(digits: 10) }
    country { Student.country_code_list.sample }
    state { 'Gujarat' }
    city { 'Surat' }
  end
end
