
namespace :db do
  desc "Seed demo data for students"
  task seed_demo_students: :environment do
    10.times do |i|
      Student.create!(
        first_name: "StudentFirstName#{i}",
        last_name: "StudentLastName#{i}",
        email: "student#{i}@example.com",
        password: "password123",
        birthdate: 18.years.ago,
        contact_no: "123456789#{i}",
        city: "City#{i}",
        state: "State#{i}",
        country: "US"
      )
    end

    puts "10 demo students created successfully."
  end
end
