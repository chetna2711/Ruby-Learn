require 'csv'

namespace :students do
  desc "Export all student data to CSV"
  task export_to_csv: :environment do
    file_path = "tmp/students_export.csv"

    CSV.open(file_path, "w") do |csv|
     
      csv << ["First Name", "Last Name", "Email", "Contact No", "City", "State", "Country"]

      Student.find_each do |student|
        csv << [student.first_name, student.last_name, student.email, student.contact_no, student.city, student.state, student.country]
      end
    end

    puts "Student data exported to #{file_path}"
  end
end
